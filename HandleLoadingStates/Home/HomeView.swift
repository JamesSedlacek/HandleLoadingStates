//
//  HomeView.swift
//  HandleLoadingStates
//
//  Created by James Sedlacek on 7/7/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM: HomeViewModel = HomeViewModel()
    
    var body: some View {
        LoadableView(loadingState: homeVM.state,
                     loadingView: LoadingPulseView(),
                     contentView: contentView,
                     failedMessage: "Network Failure!",
                     successMessage: "Loaded Items Successfully!")
    }
    
    var contentView: some View {
        VStack {
            
            HStack {
                Button {
                    Task { await homeVM.loadItems() }
                } label: {
                    Text("Load Items")
                }.padding()
                
                Spacer()
                
                Button {
                    homeVM.clear()
                } label: {
                    Text("Clear")
                }.padding()
            }.padding()
            
            HStack {
                Spacer()
                Button {
                    Task { await homeVM.networkFailureExample() }
                } label: {
                    Text("Simulate Network Failure")
                }
                Spacer()
            }.padding()
            
            HStack {
                Spacer()
                Button {
                    Task { await homeVM.loadItemsShowLoaded() }
                } label: {
                    Text("Load Items & Success Message")
                }
                Spacer()
            }.padding()
            
            Spacer()
            
            ForEach(homeVM.items) { item in
                Text(item.title).padding()
            }
            
            Spacer()
        }
    }
}
