//
//  AssessibilityVoiceOverBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/9/7.
//

import SwiftUI

struct AssessibilityVoiceOverBcamp: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle("Volume", isOn: $isActive)
                    
                    HStack {
                        Text("Volume")
                        Spacer()
                        Text(isActive ? "ON" : "OFF")
                    }
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        isActive.toggle()
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityAddTraits(.isButton)
                    .accessibilityHint("Double tap to toogle setting.")
                    .accessibilityAction {
                        isActive.toggle()
                    }
                } header: {
                    Text("Preferences")
                }
                
                Section {
                    Button("Favorites") {
                        
                    }
                    Button(action: {}, label: {
                        Image(systemName: "heart.fill")
                    })
                    
                    Text("Favorites")
                        .onTapGesture {
                            
                        }
                    
                } header: {
                    Text("Application")
                }
                
                VStack {
                    Text("Content")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack(spacing: 8) {
                            ForEach(0..<10) { x in
                                VStack {
                                    Image("SteveJobs")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                    
                                    Text("Item \(x)")
                                }
                                .onTapGesture {
                                    
                                }
                            }
                        }
                    })
                }

            }
            .navigationTitle("Setting")
        }
    }
}

#Preview {
    AssessibilityVoiceOverBcamp()
}
