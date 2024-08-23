//
//  DownloadWithEscaping.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/19.
//
// Codable protorl
// weak self
// DispatchQueue.main.async(background thread)
// @escaping

import SwiftUI

//struct PostModel: Identifiable, Codable {
//    let userId: Int
//    let id: Int
//    let title: String
//    let body: String
//}

class DownloadWithEscapingViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    init() {
        getPost()
    }
    
    func getPost() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        downloadData(fromURL: url) { returnedData in
            if let data = returnedData {
                guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.posts = newPosts
                }
            } else {
                print("No data returned.")
            }
        }
       /*
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                print("Error downloading data...")
                return
            }
            /*
            guard let data = data else {
                print("No Data.")
                return
            }
            guard error == nil else {
                print("Error: \(String(describing: error))")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("Invalid response.")
                return
            }
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                print("Status code should be 2xx, but is \(response.statusCode)")
                return
            }
             */
            /*
            print("Successfully download data".capitalized)
            print(data)
            
            let jsonString = String(data: data, encoding: .utf8)
            print(jsonString)
            */
        }.resume()
        */
    }
//@escaping 下載資料時候不會立即完成，所以要這樣寫
    func downloadData(fromURL url: URL, completionHandler: @escaping(_ data: Data?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                print("Error downloading data...")
                completionHandler(nil)
                return
            }
            completionHandler(data)
            
        }.resume()
    }
}

struct DownloadWithEscaping: View {
//@StateObject 包裝了 Download...ViewModel 類別的實例，讓 SwiftUI 可以管理其生命週期和狀態變化
    @StateObject var vm = DownloadWithEscapingViewModel()
    
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
    DownloadWithEscaping()
}
