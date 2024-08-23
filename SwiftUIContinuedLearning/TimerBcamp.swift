//
//  TimerBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/23.
//

import SwiftUI

struct TimerBcamp: View {
    
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    // Current time:
    /*
    @State var currentDate: Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }
*/
    // Countdown
    /*
    @State var count: Int = 10
    @State var finishedText: String? = nil
    */
    // Countdown to date
    /*
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()

    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futureDate)
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(minute)分:\(second)秒"
    }
*/
    // Animation counter
    @State var count: Int = 1
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color.brown, Color.green], center: .center, startRadius: 5, endRadius: 400).ignoresSafeArea()
            //Text(dateFormatter.string(from: currentDate))
            //Text(finishedText ?? "\(count)")
//            Text(timeRemaining)
//                .font(.system(size: 100, weight: .semibold,design: .rounded))
//                .foregroundStyle(.white)
//                .lineLimit(1)
//                .minimumScaleFactor(0.1)
//            HStack(spacing: 15) {
//                Circle()
//                    .offset(y: count == 1 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 2 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 3 ? -20 : 0)
//            }
//            .frame(width: 15 0 )
//            .foregroundStyle(.white)
            TabView(selection: $count,
                    content:  {
                Rectangle()
                    .foregroundStyle(.red)
                    .tag(1)
                Rectangle()
                    .foregroundStyle(.orange)
                    .tag(2)
                Rectangle()
                    .foregroundStyle(.yellow)
                    .tag(3)
                Rectangle()
                    .foregroundStyle(.purple)
                    .tag(4)
                Rectangle()
                    .foregroundStyle(.blue)
                    .tag(5)
            })
            .frame(height: 200)
            .tabViewStyle(.page)
        }
        .onReceive(timer, perform: { _ in
//            if count == 3 {
//                count = 0
//            } else {
//                count += 1
//            }
            withAnimation(.bouncy) {
                count = (count == 5) ? 1 : count + 1
            }
        })
    }
}

#Preview {
    TimerBcamp()
}
