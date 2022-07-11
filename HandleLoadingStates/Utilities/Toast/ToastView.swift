//
//  ToastView.swift
//  iProjects
//
//  Created by James Sedlacek on 6/2/22.
//

import SwiftUI

struct ToastView: View {
    @State private var isShowing = false
    @State private var hasShown = false
    let alert: AlertType
    let message: String
    
    init(alert: AlertType,
         message: String? = nil) {
        self.alert = alert
        self.message = message ?? alert.title
    }
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                alert.image
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .leading)
                    .foregroundColor(.white)
                Text(message)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(alert.color)
            .cornerRadius(8)
            .frame(height: 60)
            .padding()
            .padding(.top, isShowing ? 0 : -150)
            .opacity(hasShown ? 0 : 1)
            Spacer()
        }
        .background(.clear)
        .onAppear() {
            withAnimation(.spring(response: 1.2,
                                  dampingFraction: 0.8,
                                  blendDuration: 0.2).repeatCount(2, autoreverses: true), {
                self.isShowing.toggle()
            })
            Task {
                let duration = UInt64(3.5 * 1_000_000_000)
                try await Task.sleep(nanoseconds: duration)
                self.hasShown = true
            }
        }
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(alert: .Success)
        ToastView(alert: .Error)
        ToastView(alert: .Warning)
    }
}
