//
//  LoadableObject.swift
//  HandleLoadingStates
//
//  Created by James Sedlacek on 7/7/22.
//

import Foundation

protocol LoadableObject: ObservableObject {
    var state: LoadingState { get }
}
