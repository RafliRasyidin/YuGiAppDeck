//
//  HomeViewModel.swift
//  YuGiDeckApp
//
//  Created by Rafli Rasyidin on 17/04/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    enum ViewState {
        case START
        case LOADING
        case SUCCESS(cards: [CardInfo])
        case FAILURE(error: String)
    }
    
    @Published var currentState: ViewState = .START
    private var cancelables = Set<AnyCancellable>()
    
    init() {
        if let cachedCards = CacheManager.shared.getCachedCards() {
            self.currentState = .SUCCESS(cards: cachedCards)
        } else {
            getCards()
        }
        
    }
    
    func getCards() {
        self.currentState = .LOADING
        YGOService.shared.getYGOCards()
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        print("Excecution Finished.")
                    case .failure(let error):
                        self.currentState = .FAILURE(error: error.localizedDescription)
                    }
                },
                receiveValue: { response in
                    self.currentState = .SUCCESS(cards: response.data)
                    CacheManager.shared.cacheCards(response.data)
                }
            ).store(in: &cancelables)
    }
}
