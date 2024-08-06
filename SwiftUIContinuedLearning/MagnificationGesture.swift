//
//  MagnificationGesture.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/6.
//

import SwiftUI

struct MagnificationGesture: View {
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Circle().frame(width: 35, height: 35)
                Text("The Rock")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding()
//            Rectangle()
            Image("theRock")
                .resizable()
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(
                    SwiftUI.MagnificationGesture()
                        .onChanged { value in
                            currentAmount = value - 1
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                currentAmount = 0
                            }
                        }
                )
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            Text("I was fortunate and I was lucky that l had a couple of people in my life who cared about me. I had good, loving parents.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
        /*
        Text("Hello, World!")
            .font(.title)
            .padding(40)
            .background(Color.red.cornerRadius(10))
            .scaleEffect(1 + currentAmount + lastAmount)
            // 'MagnificationGesture' will be deprecated in a future version of iOS: renamed to 'MagnifyGesture'
            .gesture(
            // 問題出在命名衝突上。您定義了一個名為 MagnificationGesture 的 View 結構，這與 SwiftUI 預設的 MagnificationGesture 手勢類型名稱相同。使用 SwiftUI. 前綴來明確指出您要使用的是 SwiftUI 模塊中的 MagnificationGesture。
                SwiftUI.MagnificationGesture()
                    .onChanged { value in
                        currentAmount = value - 1
                    }
                    .onEnded { value in
                        lastAmount += currentAmount
                        currentAmount = 0
                    }
            )
         */
        
    }
}

#Preview {
    MagnificationGesture()
}
