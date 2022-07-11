//
//  LoadableView.swift
//  HandleLoadingStates
//
//  Created by James Sedlacek on 7/7/22.
//

import SwiftUI

struct LoadableView: View {
    let loadingView: any View
    let contentView: any View
    let failedMessage: String?
    let successMessage: String?
    let loadingState: LoadingState
    
    init(loadingState: LoadingState,
         loadingView: any View = ProgressView(),
         contentView: any View,
         failedMessage: String? = nil,
         successMessage: String? = nil) {
        self.loadingView = loadingView
        self.contentView = contentView
        self.failedMessage = failedMessage
        self.successMessage = successMessage
        self.loadingState = loadingState
    }
    
    var body: some View {
        ZStack {
            AnyView(contentView)
            
            if loadingState == .loading {
                AnyView(loadingView)
            }
            
            if loadingState == .failed {
                ToastView(alert: .Error,
                          message: failedMessage)
            }
            
            if loadingState == .success {
                ToastView(alert: .Success,
                          message: successMessage)
            }
        }
    }
}
