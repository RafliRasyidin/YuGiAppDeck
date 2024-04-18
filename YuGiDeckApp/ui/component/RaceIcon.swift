//
//  RaceIcon.swift
//  YuGiDeckApp
//
//  Created by Rafli Rasyidin on 17/04/24.
//

import SwiftUI

struct RaceIcon: View {
    var race: String
    
    var body: some View {
        switch race {
        case "Aqua": Image("icAqua")
                .resizable()
                .frame(width: 16, height: 16)
        case "Beast": Image("icBeast")
                .resizable()
                .frame(width: 16, height: 16)
        case "Beast-Warrior": Image("icBeastWarrior")
                .resizable()
                .frame(width: 16, height: 16)
        default: Image("icDragon")
                .resizable()
                .frame(width: 16, height: 16)
        }

    }
}

#Preview {
    RaceIcon(race: "Aqua")
}
