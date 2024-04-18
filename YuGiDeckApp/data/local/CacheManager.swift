//
//  CacheManager.swift
//  YuGiDeckApp
//
//  Created by Rafli Rasyidin on 17/04/24.
//

import Foundation

class CacheManager {
    static let shared = CacheManager()
    
    private var cachedCards: [CardInfo]?
    
    private init() {}
    
    func cacheCards(_ cards: [CardInfo]) {
        cachedCards = cards
    }
    
    func getCachedCards() -> [CardInfo]? {
        return cachedCards
    }
}
