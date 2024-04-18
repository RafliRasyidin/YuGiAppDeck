//
//  YuGiDeckAppApp.swift
//  YuGiDeckApp
//
//  Created by Rafli Rasyidin on 01/04/24.
//

import SwiftUI

@main
struct YuGiDeckAppApp: App {
    @ObservedObject var router = Routes()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                HomeScreen()
                    .navigationDestination(for: Routes.Destination.self) { destination in
                        switch destination {
                        case .detail(let cardId):
                            DetailScreen(cardId: cardId)
                        case .profile:
                            ProfileScreen()
                        }
                    }
                    
            }.environmentObject(router)
        }
    }
}
