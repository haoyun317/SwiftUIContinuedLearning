//
//  AlignmentGuideBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/9/7.
//

import SwiftUI

// https://swiftui-lab.com/alignment-guides/

struct AlignmentGuideBcamp: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, World")
                .background(Color.blue)
                .alignmentGuide(.leading, computeValue: { dimension in
                    return dimension.width * 0.5
                })
            
            Text("This is some other text")
                .background(Color.red)
        }
        .background(Color.orange)
    }
}

struct AlignmentChildView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            row(title: "Row 1", showIcon: false)
            row(title: "Row 2", showIcon: true)
            row(title: "Row 3", showIcon: false)
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding(40)
    }
    private func row(title: String, showIcon: Bool) -> some View {
        HStack(spacing: 10) {
            if showIcon {
                Image(systemName: "info.circle")
                    .frame(width: 30, height: 30)
            }
            
            Text(title)
            
            Spacer()
        }
        .alignmentGuide(.leading, computeValue: { dimension in
            return showIcon ? 40 : 0
        })
    }
}
#Preview {
    //AlignmentGuideBcamp()
    AlignmentChildView()
}
