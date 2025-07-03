//
//  InfiniteRotation.swift
//  Animations
//
//  Created by user272495 on 6/25/25.
//

import SwiftUI

struct InfiniteRotation: View {
    @State var rotate = false
    @State var color = Color.black
    let colors: [Color] = [.red, .blue, .green, .yellow]
    var body: some View {
        VStack {
            Image(systemName: "arrow.2.circlepath")
                .resizable()
                .foregroundStyle(color)
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(rotate ? 360 : 0))
                .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: rotate)
                .onAppear {
                    rotate = true
                    randomColor()
                }

        }
    }
    
    func randomColor() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if let color  = colors.randomElement() {
                self.color = color
            }
            if rotate{
                randomColor()
            }
        }
    }
}

#Preview {
    InfiniteRotation()
}
