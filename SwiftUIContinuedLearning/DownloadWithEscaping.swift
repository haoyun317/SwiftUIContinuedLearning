//
//  DownloadWithEscaping.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/19.
//

import SwiftUI

class DownloadWithEscapingViewModel: ObservableObject {
    
    init() {
        getPost()
    }
    
    func getPost() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
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
            print("Successfully download data".capitalized)
            print(data)
            
            let jsonString = String(data: data, encoding: .utf8)
            print(jsonString)
        }.resume()
    }
}

struct DownloadWithEscaping: View {
//@StateObject 包裝了 Download...ViewModel 類別的實例，讓 SwiftUI 可以管理其生命週期和狀態變化
    @StateObject var vm = DownloadWithEscapingViewModel()
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    DownloadWithEscaping()
}
