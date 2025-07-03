//
//  ContentView.swift
//  Notifications
//
//  Created by user272495 on 7/2/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var notificationManager: NotificationManager
    var body: some View {
        VStack {
            Button {
                notificationManager.requestPermission()
            } label: {
                Text("Request permission")
            }
            
            Button {
                notificationManager.scheduleNotification()
            } label: {
                Text("Schedule notification")
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(NotificationManager())
}
