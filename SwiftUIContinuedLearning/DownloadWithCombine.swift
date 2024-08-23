//
//  DownloadWithCombine.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/21.
//

import SwiftUI
import Combine

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
        
    @Published var posts: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        // Combine discussion:
        /*
        // 1. 註冊包月套餐，以便送貨上門
        // 2. 公司將在幕後製作包裝
        // 3. 在家門口收到包裹
        // 4. 確保包裝盒沒有損壞
        // 5. 打開並確保項目正確無誤
        // 6. use the item
        // 7. 可隨時取消
        
        // 1. create the publisher
        // 2. subscribe puklisher on background thread
        // 3. recieve on main thread
        // 4. tryMap (check that data is good?)
        // 5. decode (decode data into PostModels)
        // 6. sink (put the item into app)
        // 7. store (cancel sub if you need)
         */
        URLSession.shared.dataTaskPublisher(for: url)
            //.subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    print("FInished.")
                case .failure(let error):
                    print("There is an error: \(error)")
                }
            } receiveValue: { [weak self] returnedPosts  in
                self?.posts = returnedPosts
            }
            .store(in: &cancellables)

    }
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
}

struct DownloadWithCombine: View {
    
    @StateObject var vm = DownloadWithCombineViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    DownloadWithCombine()
}
