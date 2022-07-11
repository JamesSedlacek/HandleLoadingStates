//
//  LoadingPulseView.swift
//  iProjects
//
//  Created by James Sedlacek on 5/28/22.
//

import SwiftUI

struct LoadingPulseView: View {
    @State private var isLoading = false
    @State private var isAtMaxScale = false
    private let scaleAnimation = Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true)
    private let rotationAnimation = Animation.linear(duration: 1).repeatForever(autoreverses: false)
    let size: CGFloat = 20
    let lineWidth: CGFloat = 2
    
    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.8)
                    .stroke(Color.accentColor, lineWidth: lineWidth)
                    .frame(width: size, height: size)
                    .rotationEffect(Angle(degrees: isLoading ? 270 : -90))
                    .animation(rotationAnimation, value: isLoading)
                    .onAppear() {
                        isLoading = true
                        withAnimation(scaleAnimation, {
                            isAtMaxScale.toggle()
                        })
                    }
            }.scaleEffect(isAtMaxScale ? 0.5 : 1.0)
        }
    }
}

struct LoadingPulseView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPulseView()
    }
}
