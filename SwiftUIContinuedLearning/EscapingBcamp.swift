//
//  EscapingBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/16.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    @Published var text: String = "Hello"
    
    func getData() {
        // downloadData5
        downloadData5 { [weak self] data in
            self?.text = data.data
        }
        // downloadData4
//        downloadData4 { [weak self] data in
//            self?.text = data.data
//        }
        //downloadData3
//        downloadData3 { [weak self] data in
//            self?.text = data
//        }
        //downloadData2
//        downloadData2 { data in
//            text = data
//        }
        //downloadData()
//        let newData = downloadData()
//        text = newData
    }
    
    func downloadData() -> String {
        return "New Data!"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> Void) {
        completionHandler("New Data!")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("New Data!")
        }
    }
    
    func downloadData4(completionHandler: @escaping (downloadResult) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = downloadResult(data: "New Data!")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = downloadResult(data: "New Data!")
            completionHandler(result)
        }
    }
}

struct downloadResult {
    let data: String
}

typealias DownloadCompletion = (downloadResult) -> ()

struct EscapingBcamp: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

#Preview {
    EscapingBcamp()
}
