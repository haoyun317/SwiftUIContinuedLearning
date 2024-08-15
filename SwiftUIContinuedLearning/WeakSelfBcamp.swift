//
//  WeakSelfBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/14.
//

import SwiftUI

struct WeakSelfBcamp: View {
//一種屬性包裝器類型，可反映 UserDefaults 中的值，並在該用戶默認值發生變化時使視圖失效。AppStorage
    @AppStorage("count") var count: Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationStack {
            NavigationLink("Navigate", destination: WeakSelfSecondScreen())
                .navigationTitle("Screen 1")
        }
        .overlay(
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(Color.yellow.cornerRadius(10))
            ,alignment: .topTrailing
        )
    }
}
struct WeakSelfSecondScreen: View {
    
    @StateObject var vm = WeakSelfSecondScreenViewModel()
    
    var body: some View {
        Text("Second View")
            .font(.largeTitle)
            .foregroundStyle(.red)
        
        if let data = vm.data {
            Text(data)
        }
    }
}
class WeakSelfSecondScreenViewModel: ObservableObject {
    @Published var data: String? = nil
    
    init() {
        print("Initialize now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    func getData() {
// weak self 弱引用 如果退出時，讓這個class不用繼續活著
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "New Data"
        }
    }
    deinit {
        print("Deinitialize")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
}

#Preview {
    WeakSelfBcamp()
}
