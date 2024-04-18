//
//  DetailScreen.swift
//  YuGiDeckApp
//
//  Created by Rafli Rasyidin on 02/04/24.
//

import SwiftUI

struct DetailScreen: View {
    var cardId: String
    @ObservedObject var viewModel: DetailViewModel
    
    init(cardId: String) {
        self.cardId = cardId
        self.viewModel = DetailViewModel(idCard: cardId)
    }
    
    var body: some View {
        
        if case .LOADING = viewModel.currentState {
            LoaderView()
        } else if case .SUCCESS(let cardInfo) = viewModel.currentState {
            ScrollView {
                VStack(spacing: 0) {
                    detailInfoCard(cardInfo: cardInfo).padding(.bottom, 24)
                    
                    descCard(cardInfo: cardInfo)
                }
            }
            .containerRelativeFrame([.horizontal, .vertical])
            .background(.colorGray)
            
        } else if case .FAILURE(let error) = viewModel.currentState {
            VStack(alignment: .center) {
                Spacer()
                Text(error)
                    .font(.headline.bold())
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .padding()
        }
        
    }
    
    func descCard(cardInfo: CardInfo) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Description")
                .font(.headline)
                .bold()
                .foregroundStyle(.white)
            
            Text(cardInfo.desc)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .padding(.horizontal, 16)

    }
    
    func detailInfoCard(cardInfo: CardInfo) -> some View {
        VStack {
            AsyncImage(
                url: URL(string: cardInfo.cardImages[0].imageUrlCropped),
                content: { image in
                    image.resizable()
                },
                placeholder: {
                    ProgressView()
                }
            )
            .aspectRatio(CGSize(width: 1, height: 1), contentMode: .fit)
            .frame(height: 200)
            .clipShape(.rect(cornerRadii: RectangleCornerRadii(
                topLeading: 12,
                bottomLeading: 12,
                bottomTrailing: 12,
                topTrailing: 12
            )))
            .padding(.bottom, 16)
            
            Text(cardInfo.name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .bold()
                .foregroundStyle(.white)
                .padding(.bottom, 8)
            
            HStack(spacing: 8) {
                RaceIcon(race: cardInfo.race)
                
                Text(cardInfo.type + " / " + cardInfo.attribute.capitalized)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .bold()
                
                RaceIcon(race: cardInfo.race)
            }
            .padding(.bottom, 12)
            
            HStack {
                ForEach((1...cardInfo.level), id: \.self) { _ in
                    Image("icStarBall")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 16, height: 16)
                }
            }
            .padding(.bottom, 12)
            
            HStack(spacing: 8) {
                Spacer()
                
                Image("icSword")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(.gray)
                    .frame(width: 16, height: 16)
                Text(cardInfo.atk.codingKey.stringValue)
                    .font(.callout)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.trailing, 8)
                
                Image("icShield")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(.gray)
                    .frame(width: 16, height: 16)
                    .padding(.leading, 8)
                Text(cardInfo.def.codingKey.stringValue)
                    .font(.callout)
                    .bold()
                    .foregroundStyle(.white)
                
                Spacer()

            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    DetailScreen(cardId: dataDummy[0].id.codingKey.stringValue)
}
