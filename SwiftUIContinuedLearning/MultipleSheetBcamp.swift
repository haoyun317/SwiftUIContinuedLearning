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

//1 - use a binding
//2 - use multiple .sheets
//3 - use $item

struct MultipleSheetBcamp: View {
    
    @State var selectedModel: RandomModel = RandomModel(title: "Strat Model")
    @State var showSheet: Bool = false
    @State var showSheet2: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Button 1") {
                //selectedModel = RandomModel(title: "One")
                showSheet.toggle()
            }
            Button("Button 2") {
                //selectedModel = RandomModel(title: "Two")
                showSheet2.toggle()
            }
            .sheet(isPresented: $showSheet2, content: {
                NextScreen(selectedModel: RandomModel(title: "Two"))
            })
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
