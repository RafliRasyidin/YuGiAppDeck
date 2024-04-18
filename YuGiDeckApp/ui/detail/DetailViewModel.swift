//
//  DetailViewModel.swift
//  YuGiDeckApp
//
//  Created by Rafli Rasyidin on 17/04/24.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    var idCard: String
    
    init(idCard: String) {
        self.idCard = idCard
        getDetailCard()
    }
    
    enum ViewState {
        case START
        case LOADING
        case SUCCESS(cardInfo: CardInfo)
        case FAILURE(error: String)
    }
    
    @Published var currentState: ViewState = .START
    private var cancelables = Set<AnyCancellable>()
    
    func getDetailCard() {
        self.currentState = .LOADING
        YGOService.shared.getDetailCard(idCard: idCard)
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
                    self.currentState = .SUCCESS(cardInfo: response.data[0])
                }
            ).store(in: &cancelables)
    }
}
