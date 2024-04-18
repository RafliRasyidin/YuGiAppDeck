//
//  Loader.swift
//  YuGiDeckApp
//
//  Created by Rafli Rasyidin on 17/04/24.
//

import Foundation
import SwiftUI

struct LoaderView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.05)
                .ignoresSafeArea()
            ProgressView()
                .scaleEffect(1, anchor: .center)
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.colorGray)

    }
}
