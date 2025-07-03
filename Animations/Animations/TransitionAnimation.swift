//
//  TransitionAnimation.swift
//  Animations
//
//  Created by user272495 on 6/25/25.
//

import SwiftUI

struct TransitionAnimation: View {
    @State var showBox = false
    
    var body: some View {
        VStack {
            if showBox {
                Rectangle()
                    .fill(.green)
                    .frame(width: 100, height: 100)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .animation(.easeInOut, value: showBox)
            }
            Button {
                withAnimation {
                    showBox.toggle()
                }
            } label: {
                Text("Show/Hide")
            }
        }
        

    }
}

#Preview {
    TransitionAnimation()
}
