//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Michał Ślusarczyk on 06/05/2021.
//

import Foundation
import SwiftUI

struct BackgroundView : View {
    var backgroundColor = Color.red
    
    init(color: Color = Color.red) {
        backgroundColor = color
    }

    var body : some View {
        ZStack {
            Circle()
                .fill(backgroundColor)
                .padding(20)
            Circle()
                .fill(Color.white)
                .padding(40)
            Circle()
                .fill(backgroundColor)
                .padding(60)
            Circle()
                .fill(Color.white)
                .padding(80)
            Circle()
                .fill(backgroundColor)
                .padding(100)
        }.opacity(0.3)
    }
}
