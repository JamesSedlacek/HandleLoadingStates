//
//  HomeViewModel.swift
//  HandleLoadingStates
//
//  Created by James Sedlacek on 7/7/22.
//

import SwiftUI

class HomeViewModel: ObservableObject, LoadableObject {
    @Published private(set) var state: LoadingState = .idle
    @Published private(set) var items: [Item] = []
    
    @MainActor
    func loadItems() async {
        self.state = .loading
        do {
            let loadedItems = try await NetworkingService.mockAPIcall(seconds: 3)
            self.items = loadedItems
            self.state = .idle
        } catch {
            self.state = .failed
        }
    }
    
    @MainActor
    func loadItemsShowLoaded() async {
        self.state = .loading
        do {
            let loadedItems = try await NetworkingService.mockAPIcall(seconds: 3)
            self.items = loadedItems
            self.state = .success
        } catch {
            self.state = .failed
        }
    }
    
    @MainActor
    func networkFailureExample() async {
        self.state = .loading
        do {
            try await NetworkingService.mockAPIcallFailure(seconds: 3)
        } catch {
            self.state = .failed
        }
    }
    
    func clear() {
        self.items = []
    }
}
