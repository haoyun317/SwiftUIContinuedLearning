//
//  BackgroundThredBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/14.
//

import SwiftUI

class BackgroundThredViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    func fetchData() {
        let newData = downloadData()
        dataArray = newData
    }
    
    private func downloadData() -> [String] {
        var data: [String] = []
        
        for x in 0..<100 {
            data.append("\(x)")
            print(data)
        }
        return data
    }
}

struct BackgroundThredBcamp: View {
    
    @StateObject var vm = BackgroundThredViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Load Data")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                ForEach(vm.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                    
                }
            }
        }
    }
}

#Preview {
    BackgroundThredBcamp()
}
