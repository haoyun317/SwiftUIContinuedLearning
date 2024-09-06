//
//  AssessibilityColorsBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/9/6.
//

import SwiftUI

struct AssessibilityColorsBcamp: View {
    
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.colorSchemeContrast) var colorSchemeContrast
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityInvertColors) var invertColors
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("Button 1") {
                    
                }
                .foregroundStyle(colorSchemeContrast == .increased ? .white : .primary)
                .buttonStyle(.borderedProminent)
                
                Button("Button 2") {
                    
                }
                .foregroundStyle(.primary)
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                
                Button("Button 3") {
                    
                }
                .foregroundStyle(.white)
                .foregroundStyle(.primary)
                .buttonStyle(.borderedProminent)
                .tint(.green)
                
                Button("Button 4") {
                    
                }
                .foregroundStyle(differentiateWithoutColor ? Color.white : Color.green)
                .buttonStyle(.borderedProminent)
                .tint(differentiateWithoutColor ? Color.black : Color.purple)
            }
            .font(.largeTitle)
//            .navigationTitle("HI")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
        }
    }
}

#Preview {
    AssessibilityColorsBcamp()
}
