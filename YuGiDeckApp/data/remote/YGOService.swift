//
//  YGOService.swift
//  YuGiDeckApp
//
//  Created by Rafli Rasyidin on 17/04/24.
//

import Foundation
import Combine

class YGOService {
    static let shared = YGOService()
    
    func getYGOCards() -> AnyPublisher<YGOCardResponse, Error> {
        let urlCards = "https://db.ygoprodeck.com/api/v7/cardinfo.php?sort=name&race=Aqua,Beast,Beast-Warrior,Dragon&type=Normal Monster,Effect Monster"
        guard let url = URL(string: urlCards) else {
            return Fail(error: "Unable to generate url" as! Error).eraseToAnyPublisher()
        }
        return Future { promise in
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                DispatchQueue.main.async {
                    do {
                        guard let data = data else {
                            return promise(.failure("Something went wrong" as! Error))
                        }
                        let cards = try JSONDecoder().decode(YGOCardResponse.self, from: data)
                        return promise(.success(cards))
                    } catch let error {
                        print(error)
                        return promise(.failure(error))
                    }
                }
            }.resume()
        }.eraseToAnyPublisher()
    }
    
    func getDetailCard(idCard: String) -> AnyPublisher<YGOCardResponse, Error> {
        let urlDetailCard = "https://db.ygoprodeck.com/api/v7/cardinfo.php?id=" + idCard
        guard let url = URL(string: urlDetailCard) else {
            return Fail(error: "Unable to generate url" as! Error).eraseToAnyPublisher()
        }
        return Future { promise in
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                DispatchQueue.main.async {
                    do {
                        guard let data = data else {
                            return promise(.failure("Something went wrong" as! Error))
                        }
                        let detailCard = try JSONDecoder().decode(YGOCardResponse.self, from: data)
                        return promise(.success(detailCard))
                    } catch let error {
                        print(error)
                        return promise(.failure(error))
                    }
                }
            }.resume()
        }.eraseToAnyPublisher()
    }
}
