//
//  File.swift
//  YuGiDeckApp
//
//  Created by Rafli Rasyidin on 16/04/24.
//

import Foundation

struct YGOCardResponse: Codable {
    var data: [CardInfo] = []
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

struct CardInfo: Codable, Identifiable {
    var id            : Int          = 0
    var name          : String       = ""
    var type          : String       = ""
    var frameType     : String       = ""
    var desc          : String       = ""
    var atk           : Int          = 0
    var def           : Int          = 0
    var level         : Int          = 0
    var race          : String       = ""
    var attribute     : String       = ""
    var ygoprodeckUrl : String       = ""
    var cardImages    : [CardImages] = []
    
    enum CodingKeys: String, CodingKey {
        
        case id            = "id"
        case name          = "name"
        case type          = "type"
        case frameType     = "frameType"
        case desc          = "desc"
        case atk           = "atk"
        case def           = "def"
        case level         = "level"
        case race          = "race"
        case attribute     = "attribute"
        case ygoprodeckUrl = "ygoprodeck_url"
        case cardImages    = "card_images"
        
    }

}
