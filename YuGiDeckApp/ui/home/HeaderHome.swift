//
//  HeaderHome.swift
//  YuGiDeckApp
//
//  Created by Rafli Rasyidin on 02/04/24.
//

import SwiftUI

struct HeaderHome: View {
    @EnvironmentObject var router: Routes
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Button(
                    action: { router.navigate(to: .profile) },
                    label: {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 36, height: 36)
                            .foregroundColor(.white)
                    }
                )
            }
            Text("YGO App Deck")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
        .background(Color("ColorBlack"))
    }
}

#Preview {
    HeaderHome()
}
