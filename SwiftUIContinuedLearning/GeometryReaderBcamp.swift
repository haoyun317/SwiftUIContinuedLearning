//
//  GeometryReaderBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/8.
//
// [Note} 適合支持畫面縱向與橫向模式才使用，似乎很消耗算力

import SwiftUI

struct GeometryReaderBcamp: View {
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: geometry.size.width * 0.66)
                Rectangle()
                    .fill(Color.blue)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    GeometryReaderBcamp()
}
