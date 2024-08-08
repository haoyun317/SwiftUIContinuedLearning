//
//  ScrollViewReaderBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/8.
//

import SwiftUI

struct ScrollViewReaderBcamp: View {
    var body: some View {
        ScrollView {
//            ScrollViewReader(content: { proxy in
//                /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
//            })
            // 一樣的上下完全一下
            ScrollViewReader { proxy in
                Button("Click here to go to #30") {
                    withAnimation(.spring()) {
                        // proxy.scrollTo(id: Hashable, anchor: UnitPoint?)
                         proxy.scrollTo(30, anchor: .top)
                    }
                }
                
                ForEach(0..<50) { index in
                    Text("This is item #\(index) ")
                        .font(.headline)
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding()
                    // let proxy know which "id" is which "index"
                        .id(index)
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaderBcamp()
}
