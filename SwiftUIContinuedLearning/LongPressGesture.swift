//
//  LongPressGesture.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/5.
//

import SwiftUI

struct LongPressGesture: View {
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    @State var isPressing: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .fill(isSuccess ? .green : .blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            HStack {
                Text("Click here")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
                        // 在最小持續時間（1秒）后執行
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    } onPressingChanged: { isPressing in
                        if isPressing {
                            // 開始按壓時
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete = true
                            }
                        } else {
                            // 結束按壓時
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    }
                // onLongPressGesture 舊的API 寫法
//                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) { (isPressing) in
//                    // start of press -> min duration
//                        if isPressing {
//                            withAnimation(.easeInOut(duration: 1.0)) {
//                                isComplete = true
//                            }
//                        } else {
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                                if !isSuccess {
//                                    withAnimation(.easeInOut) {
//                                        isComplete = false
//                                    }
//                                }
//                            }
//                        }
//
//                    } perform: {
//                        // at the min duration
//                        withAnimation(.easeInOut) {
//                            isSuccess = true
//                        }
//                    }
                Text("Reset")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
            
            Spacer()
            
            
//            Text(isComplete ? "Complete" : "Not Complete")
//                .padding()
//                .padding(.horizontal)
//                .background(isComplete ? .green : .gray)
//                .cornerRadius(10)
//    //            .onTapGesture {
//    //                isComplete.toggle()
//    //            }
//            // maximumDistance 離物件距離多遠依然可以(數字越大越遠)
//                .onLongPressGesture(minimumDuration: 1, maximumDistance: 50) {
//                    isComplete.toggle()
//            }
        }
    }
}

#Preview {
    LongPressGesture()
}
