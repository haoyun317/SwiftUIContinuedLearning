//
//  TimerBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/23.
//

import SwiftUI

struct TimerBcamp: View {
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color.brown, Color.green], center: .center, startRadius: 5, endRadius: 400).ignoresSafeArea()
            Text("Hi")
                .font(.system(size: 100, weight: .semibold,design: .rounded))
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
    }
}

#Preview {
    TimerBcamp()
}
