//
//  ImplicitAnimation.swift
//  Animations
//
//  Created by user272495 on 6/25/25.
//

import SwiftUI

struct ImplicitAnimation: View {
    @State var isExpanded = false
    var body: some View {
        VStack {
            
            Circle()
                .frame(
                    width: isExpanded ? 200 : 100,
                    height: isExpanded ? 200 : 100)
                .animation(.easeInOut(duration: 3), value: isExpanded)
                .onTapGesture {
                    isExpanded.toggle()
                }
        }
    }
}

#Preview {
    ImplicitAnimation()
}
