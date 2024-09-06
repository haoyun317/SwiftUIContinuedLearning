//
//  AccessibilityTextBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/9/6.
//

import SwiftUI

// Dynamic Text

struct AccessibilityTextBcamp: View {
    
//    @Environment(\.sizeCategory) var sizeCategory  已棄用
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var body: some View {
        NavigationStack {
           List {
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "heart.fill")
//                                .font(.system(size: 20)) //控制systemImage大小在30
                            Text("Hello World!")
                        }
                        .font(.title)
                        
                        Text("This is some longer text that expands to multiple lines.")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(3)
                            .minimumScaleFactor(dynamicTypeSize.customMinScaleFactor)
                    }
                    .background(.red)
                }
            }
           .listStyle(.plain)
           .navigationTitle("Hello, World!")
        }
    }
}
//已棄用
extension ContentSizeCategory {
    var customMinScaleFactor: CGFloat {
        switch self {
            case .extraSmall, .small, .medium:
                return 1.0
            case .large, .extraLarge, .extraExtraLarge:
                return 0.8
            default:
                return 0.7
        }
    }
}

extension DynamicTypeSize {
    var customMinScaleFactor: CGFloat {
        switch self {
            case .xSmall, .small, .medium:
                return 1.0
            case .large, .xLarge, .xxLarge:
                return 0.8
            default:
                return 0.7
        }
    }
}


#Preview {
    AccessibilityTextBcamp()
}
