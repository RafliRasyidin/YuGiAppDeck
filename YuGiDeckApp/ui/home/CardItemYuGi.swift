//
//  CardItemYuGi.swift
//  YuGiDeckApp
//
//  Created by Rafli Rasyidin on 02/04/24.
//

import SwiftUI

struct CardItemYuGi: View {
    var cardInfo: CardInfo
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 16) {
                AsyncImage(
                    url: URL(string: cardInfo.cardImages[0].imageUrlSmall),
                    content: { image in
                        image.resizable()
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                .aspectRatio(CGSize(width: 1, height: 1.5), contentMode: .fit)
                .frame(height: 100)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 8) {
                        Text(cardInfo.name)
                            .font(.subheadline)
                            .foregroundStyle(.colorWhite)
                            .lineLimit(1)
                            .bold()
                        
                        Spacer()
                        
                        RaceIcon(race: cardInfo.race)
                    }
                    
                    Text(cardInfo.desc)
                        .font(.caption)
                        .lineLimit(2)
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    
                    HStack {
                        Image("icSword")
                            .resizable()
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.gray)
                            .frame(width: 16, height: 16)
                        
                        Text(cardInfo.atk.codingKey.stringValue)
                            .font(.callout)
                            .bold()
                            .foregroundColor(.gray)
                            .padding(.trailing, 16)
                        
                        Image("icShield")
                            .resizable()
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.gray)
                            .frame(width: 16, height: 16)
                        
                        Text(cardInfo.def.codingKey.stringValue)
                            .font(.callout)
                            .bold()
                            .foregroundColor(.gray)
                    }
                    
                }
                
            }
            .frame(maxHeight: 100)
            
        }
    }
}

#Preview {
    CardItemYuGi(cardInfo: dataDummy.first!)
        .background(Color.colorGray)
}
