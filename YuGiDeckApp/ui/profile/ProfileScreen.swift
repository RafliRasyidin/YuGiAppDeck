//
//  ProfileScreen.swift
//  YuGiDeckApp
//
//  Created by Rafli Rasyidin on 02/04/24.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(height: 120)
                .foregroundStyle(.colorGray)
            
            Image("imgProfile")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 120, height: 120)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 16)
            
            Text("Rafli Rasyidin")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.white)
                .bold()
                .padding(.bottom, 8)
            
            Text("raflirasyidin20@gmail.com")
                .font(.subheadline)
            
            Spacer()

        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.colorGray)

    }
}

#Preview {
    ProfileScreen()
}
