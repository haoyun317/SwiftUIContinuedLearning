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
        Text("Hello, World!")
            .font(.title)
            .padding(40)
            .background(Color.red.cornerRadius(10))
            .scaleEffect(1 + currentAmount)
            // 'MagnificationGesture' will be deprecated in a future version of iOS: renamed to 'MagnifyGesture'
            .gesture(
                //MagnificationGesture()
                MagnifyGesture()
                    .onChanged { value in
                        currentAmount = value.magnification
                    }
                    .onEnded { value in
                        lastAmount += currentAmount
                        currentAmount = 0
                    }
            )
    }
}

#Preview {
    MagnificationGesture()
}
