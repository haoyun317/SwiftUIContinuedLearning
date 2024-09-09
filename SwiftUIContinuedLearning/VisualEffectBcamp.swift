//
//  VisualEffectBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/9/7.
//

import SwiftUI

struct VisualEffectBcamp: View {
    
    //@State private var showSpacer: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ForEach(0..<100) { index in
                    Rectangle()
                        .frame(width: 300, height: 200)
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .visualEffect { content, geometry in
                            content
                                .offset(x: geometry.frame(in: .global).minY * 0.45)
                        }
                }
            }
        }
//        VStack {
//            Text("(geometry.frame(in: .global).minY < 300 ? 1 : 0)")
//                .padding()
//                .background(Color.red)
//                .visualEffect { content, geometry in
//                    content
//                        .grayscale(geometry.frame(in: .global).minY < 300 ? 1 : 0)
//                        //.grayscale(geometry.size.width >= 200 ? 1 : 0)
//            }
//            if showSpacer {
//                Spacer()
//            }
//        }
//        .animation(.bouncy, value: showSpacer)
//        .onTapGesture {
//            showSpacer.toggle()
//        }
    }
}

#Preview {
    VisualEffectBcamp()
}
