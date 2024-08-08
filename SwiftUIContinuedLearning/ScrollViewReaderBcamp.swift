//
//  ScrollViewReaderBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/8.
//

import SwiftUI

struct ScrollViewReaderBcamp: View {
    @State var textFieldText: String = ""
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            TextField("Enter a # here...", text: $textFieldText)
                .frame(height: 55)
                .foregroundStyle(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Scroll Now!") {
                withAnimation(.spring()) {
                    // index是 index?
                    if let index = Int(textFieldText) {
                       scrollToIndex = index
                    }
                    // proxy.scrollTo(id: Hashable, anchor: UnitPoint?)
                     //proxy.scrollTo(30, anchor: .top)
                }
            }
            
            ScrollView {
    //            ScrollViewReader(content: { proxy in
    //                /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
    //            })
                // 一樣的上下完全一下
                ScrollViewReader { proxy in
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
                    .onChange(of: scrollToIndex) { newIndex in
                        withAnimation(.spring()) {
                            proxy.scrollTo(newIndex, anchor: .center)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaderBcamp()
}
