//
//  Routes.swift
//  YuGiDeckApp
//
//  Created by Rafli Rasyidin on 02/04/24.
//

import Foundation
import SwiftUI

final class Routes: ObservableObject {
    public enum Destination: Codable, Hashable {
        case detail(idCard: String)
        case profile
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func pop() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
