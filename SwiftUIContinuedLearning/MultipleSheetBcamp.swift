//
//  MultipleSheetBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/10.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
     
}

struct MultipleSheetBcamp: View {
    
    @State var selectedModel: RandomModel = RandomModel(title: "Strat Model")
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Button 1") {
                selectedModel = RandomModel(title: "One")
                showSheet.toggle()
            }
            Button("Button 2") {
                selectedModel = RandomModel(title: "Two")
                showSheet.toggle()
            }
        }
        .sheet(isPresented: $showSheet, content: {
            NextScreen(selectedModel: selectedModel)
        })
    }
}

struct NextScreen: View {
    
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetBcamp()
}
