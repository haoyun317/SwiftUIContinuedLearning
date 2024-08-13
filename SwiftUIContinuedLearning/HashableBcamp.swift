//
//  HashableBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/13.
//

import SwiftUI

struct myCustomModel: Hashable {
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title )
    }
}

struct HashableBcamp: View {
    let data: [myCustomModel] = [
        myCustomModel(title: "one"),
        myCustomModel(title: "two"),
        myCustomModel(title: "three"),
        myCustomModel(title: "four"),
        myCustomModel(title: "five")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                ForEach(data, id: \.self) { item in
                    Text(item.hashValue.description)
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    HashableBcamp()
}
