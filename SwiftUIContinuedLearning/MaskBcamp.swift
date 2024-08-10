//
//  MaskBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/10.
//

import SwiftUI

struct MaskBcamp: View {
    @State var rating: Int = 1
    
    var body: some View {
        ZStack {
            HStack {
                ForEach(1..<6) { index in
                    Image(systemName: "star.fill")
                        .font(.largeTitle)
                        .foregroundStyle(rating >= index ? Color.yellow : Color.gray)
                        .onTapGesture {
                            rating = index
                        }
                }
            }
        }
    }
}

#Preview {
    MaskBcamp()
}
