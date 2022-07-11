//
//  AlertType.swift
//  HandleLoadingStates
//
//  Created by James Sedlacek on 7/7/22.
//

import SwiftUI

enum AlertType {
    case Success
    case Error
    case Warning
    
    var image: Image {
        switch self {
        case .Success:
            return Image(systemName: "checkmark.circle")
        case .Error:
            return Image(systemName: "xmark.octagon")
        case .Warning:
            return Image(systemName: "exclamationmark.triangle")
        }
    }
    
    var title: String {
        switch self {
        case .Success:
            return "Successfully Posted!"
        case .Error:
            return "Network Error!"
        case .Warning:
            return "Something went wrong!"
        }
    }
    
    var color: Color {
        switch self {
        case .Success:
            return .green
        case .Error:
            return .red
        case .Warning:
            return .yellow
        }
    }
}
