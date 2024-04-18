//
//  CardImages.swift
//  YuGiDeckApp
//
//  Created by Rafli Rasyidin on 16/04/24.
//

import Foundation

struct CardImages: Codable {
    
    var id              : Int    = 0
    var imageUrl        : String = ""
    var imageUrlSmall   : String = ""
    var imageUrlCropped : String = ""
    
    enum CodingKeys: String, CodingKey {
        
        case id              = "id"
        case imageUrl        = "image_url"
        case imageUrlSmall   = "image_url_small"
        case imageUrlCropped = "image_url_cropped"
        
    }
    
}
