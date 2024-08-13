//
//  LocalNotificationBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/12.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    static let instance = NotificationManager() // singleton
    
    func requestAuthorization() {
        
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "This is my first Notification!!"
        content.subtitle = "This is subtitle"
        content.sound = .default
        content.badge = 1
        
        // time
       // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // calender
//        var dateComponents = DateComponents()
//        dateComponents.hour = 11
//        dateComponents.minute = 11
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // location
        let coordinates = CLLocationCoordinate2D(
            latitude: 40.00,
            longitude: 50.00)
        
        let region = CLCircularRegion(
            center: coordinates,
            radius: 50,
            identifier: UUID().uuidString)
        // 到達地點時通知
        region.notifyOnEntry = true
        // 離開地點時通知
        region.notifyOnExit = false
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
    func clearBadgeCount() {
        UNUserNotificationCenter.current().setBadgeCount(0)
    }
}

struct LocalNotificationBcamp: View {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Request Permission") {
                NotificationManager.instance.requestAuthorization()
            }
            Button("Schedule Notification") {
                NotificationManager.instance.scheduleNotification()
            }
            Button("Cancel Notification", action: {
                NotificationManager.instance.cancelNotification()
            })
            .onChange(of: scenePhase) {
                // Clear the badge count when the app becomes active
                NotificationManager.instance.clearBadgeCount()
                
            }
                
            
        }
        Text("Hello, World!")
    }
}

#Preview {
    LocalNotificationBcamp()
}
