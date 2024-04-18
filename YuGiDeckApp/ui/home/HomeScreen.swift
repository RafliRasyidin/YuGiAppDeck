//
//  ContentView.swift
//  YuGiDeckApp
//
//  Created by Rafli Rasyidin on 01/04/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var router: Routes
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            HeaderHome()
            Spacer()
            if case .LOADING = viewModel.currentState {
                LoaderView()
            } else  if  case .SUCCESS(let cards) = viewModel.currentState {
                List {
                    Section {
                        ForEach(cards) { cardInfo in
                            CardItemYuGi(cardInfo: cardInfo)
                                .gesture(TapGesture().onEnded({
                                    router.navigate(to: .detail(idCard: cardInfo.id.codingKey.stringValue))
                                }))
                                .listRowBackground(Color.colorGray)
                                .listRowSeparatorTint(Color.gray)
                            
                        }
                    }
                    
                }
                .listStyle(.plain)
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
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.colorGray)
    }
}

#Preview {
    HomeScreen()
}
