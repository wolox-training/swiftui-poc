//
//  PrimaryButtonStyle.swift
//  WBooks
//
//  Created by Gabriel Mazzei on 06/05/2021.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    private struct Constants {
        static let horizontalPadding: CGFloat = 20
        static let verticalPadding: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textCase(.uppercase)
            .foregroundColor(.white)
            .padding(
                EdgeInsets(top: Constants.verticalPadding,
                           leading: Constants.horizontalPadding,
                           bottom: Constants.verticalPadding,
                           trailing: Constants.horizontalPadding)
            )
            .overlay(
                Capsule()
                    .stroke(Color.white,
                            style: StrokeStyle(lineWidth: Constants.lineWidth))
            )
    }
}
