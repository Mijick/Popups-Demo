//
//  PrimaryButton.Height .swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 25.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI

extension PrimaryButton {
    @MainActor enum Height { case small, big }
}

extension PrimaryButton.Height {
    var value: CGFloat {
        switch self {
            case .small: 36
            case .big: 56
        }
    }
    var cornerRadius: CGFloat {
        switch self {
            case .big: 14
            case .small: 9
        }
    }
    var font: CustomFont {
        switch self {
            case .big: .medium
            case .small: .small(.bold)
        }
    }
}
