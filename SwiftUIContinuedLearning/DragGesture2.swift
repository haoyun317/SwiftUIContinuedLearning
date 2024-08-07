//
//  DragGesture2.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/7.
//

import SwiftUI

struct DragGesture2: View {
    
    //@State var startingOffsetY: CGFloat = view.window?.windowScene?.screen.bounds.height
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffestY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            MySignUpView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffestY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                currentDragOffestY = value.translation.height
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                //增加畫面向上移動到多少就可以展開而不會縮回去
                                if currentDragOffestY < -150 {
                                    endingOffsetY = -startingOffsetY
                                } else if endingOffsetY != 0 && currentDragOffestY > 150 {
                                    endingOffsetY = 0
                                }
                                currentDragOffestY = 0
                            }
                        }
                )
            Text("\(currentDragOffestY)")
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    DragGesture2()
}

struct MySignUpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sign Up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("This is the decription for our app. This is my favorite SwiftuI course and I recommend to all of my friends to subscribe to Swiftful Thinking!")
                .multilineTextAlignment(.center)
            
            Text("create accont".uppercased())
                .foregroundStyle(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black.cornerRadius(10))
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
    }
}
