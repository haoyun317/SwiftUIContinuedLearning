//
//  ArraysBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/13.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filterArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    @Published var mappedIntArray: [String] = []
    
    init() {
        getUser()
        updateFilteredArray()
    }
    func getUser() {
        let user1 = UserModel(name: nil, points: 1200, isVerified: true)
        let user2 = UserModel(name: "Bob", points: 850, isVerified: false)
        let user3 = UserModel(name: "Charlie", points: 920, isVerified: true)
        let user4 = UserModel(name: "David", points: 430, isVerified: false)
        let user5 = UserModel(name: "Eva", points: 770, isVerified: true)
        let user6 = UserModel(name: "Frank", points: 1150, isVerified: true)
        let user7 = UserModel(name: "Grace", points: 600, isVerified: false)
        let user8 = UserModel(name: "Hank", points: 340, isVerified: true)
        let user9 = UserModel(name: "Ivy", points: 920, isVerified: false)
        let user10 = UserModel(name: "Jack", points: 510, isVerified: true)
        dataArray.append(contentsOf: [
            user1, user2, user3, user4, user5, user6, user7, user8, user9, user10
        ])
    }
    
    func updateFilteredArray() {
        // sort
        /*
        filterArray = dataArray.sorted(by: {$0.points > $1.points})
         */
        // filter
        /*
        filterArray = dataArray.filter({ $0.isVerified })
        */
        // map
        /*
         //mappedArray = dataArray.map({ $0.name })
         // NOTE: dataArray可以換成其他filiteredArray等等，在原本基礎上再進行一次map
         //mappedIntArray = dataArray.map({"\($0.points)"})
         
         //compactMap 如果UserModel裡有 optional, 可以過濾掉 optional
         mappedArray = dataArray.compactMap({ $0.name })
         */
        
        let sort = dataArray.sorted(by: { $0.points > $1.points})
        let filter = dataArray.filter({ $0.isVerified })
        let map = dataArray.compactMap({ $0.name })
        
        mappedArray = dataArray
            .sorted(by: { $0.points > $1.points})
            .filter({ $0.isVerified })
            .compactMap({ $0.name })
    }
}

struct ArraysBcamp: View {
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.largeTitle)
                }
//                ForEach(vm.filterArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("point: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundStyle(.white)
//                    .padding()
//                    .background(Color.black.cornerRadius(10))
//                    .padding(.horizontal)
//                }
            }
        }
        Text("Hello, World!")
    }
}

#Preview {
    ArraysBcamp()
}
