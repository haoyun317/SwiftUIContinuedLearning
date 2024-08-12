//
//  LocalNotificationBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/12.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    static let instance = NotificationManager() // singleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
//.requestAuthorization(options: <#T##UNAuthorizationOptions#>, completionHandler: <#T##(Bool, (any Error)?) -> Void#>)
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
}

struct LocalNotificationBcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request permission") {
                NotificationManager.instance.requestAuthorization()
            }
        }
        Text("Hello, World!")
    }
}

#Preview {
    LocalNotificationBcamp()
}
