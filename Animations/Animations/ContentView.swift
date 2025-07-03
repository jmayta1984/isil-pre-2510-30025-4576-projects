//
//  ContentView.swift
//  Animations
//
//  Created by user272495 on 6/25/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Implicit", systemImage: "circle") {
                ImplicitAnimation()
            }
            Tab("Transition", systemImage: "square") {
                TransitionAnimation()
            }
            Tab("Infinite", systemImage: "arrow.2.circlepath") {
                InfiniteRotation()
            }
        }
    }
}

#Preview {
    ContentView()
}
