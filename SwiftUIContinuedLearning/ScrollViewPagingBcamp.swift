//
//  ScrollViewPagingBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/9/9.
//

import SwiftUI

struct ScrollViewPagingBcamp: View {
    
    @State private var scrollPosition: Int? = nil
    
    var body: some View {
        VStack {
            Button("Scroll to:") {
                scrollPosition = (0..<20).randomElement()
            }
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(0..<20) { index in
                            Rectangle()
                            .frame(width: 300, height: 300)
                            .cornerRadius(10)
                            .overlay(
                                Text("\(index)").foregroundStyle(.white)
                            )
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .id(index)
                            .scrollTransition(.interactive.threshold(.visible(0.9))) { Content, phase in
                                Content
                                    .opacity(phase.isIdentity ? 1 : 0)
                                    .offset(y: phase.isIdentity ? 0 : -100)
                            }
                            //.containerRelativeFrame(.horizontal, alignment: .center)
                    }
                }
                .padding(.vertical, 100)
            }
            .ignoresSafeArea()
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
    /*
     是一個屬性，可以用來控制 ScrollView 的彈回行為（bounce behavior）。當 ScrollView 的內容超出其邊界時，彈回行為會發生，ScrollView 會自動彈回到其邊界內。

     雖然 scrollBounceBehavior 可以控制 ScrollView 的動態行為，但是它並不算是一種動畫（animation）。動畫是一種通過時間的變化來創建視覺效果的技術，而 scrollBounceBehavior 只是控制 ScrollView 的物理行為。
     */
            .scrollBounceBehavior(.basedOnSize)
            .scrollPosition(id: $scrollPosition, anchor: .center)
            .animation(.smooth, value: scrollPosition)
        }
        
//        ScrollView {
//            VStack(spacing: 0) {
//                ForEach(0..<20) { index in
//                        Rectangle()
//                        //.frame(width: 300, height: 300)
//                        .overlay(
//                            Text("\(index)").foregroundStyle(.white)
//                        )
//                        .frame(maxWidth: .infinity)
//                        //.padding(.vertical, 10)
//                        .containerRelativeFrame(.vertical, alignment: .center)
//                }
//            }
//        }
//        .ignoresSafeArea()
//        .scrollTargetLayout()
//        .scrollTargetBehavior(.paging)
///*
// 是一個屬性，可以用來控制 ScrollView 的彈回行為（bounce behavior）。當 ScrollView 的內容超出其邊界時，彈回行為會發生，ScrollView 會自動彈回到其邊界內。
//
// 雖然 scrollBounceBehavior 可以控制 ScrollView 的動態行為，但是它並不算是一種動畫（animation）。動畫是一種通過時間的變化來創建視覺效果的技術，而 scrollBounceBehavior 只是控制 ScrollView 的物理行為。
// */
//        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    ScrollViewPagingBcamp()
}
