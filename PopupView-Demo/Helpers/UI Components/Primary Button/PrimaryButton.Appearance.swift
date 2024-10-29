//
//  PrimaryButton.Appearance.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 23.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI

extension PrimaryButton {
    @MainActor enum Appearance { case accented, accentedAlternative }
}

extension PrimaryButton.Appearance {
    var backgroundColor: Color {
        switch self {
            case .accented: .backgroundInverted
            case .accentedAlternative: .backgroundTertiary
        }
    }
    var textColour: Color {
        switch self {
            case .accented: .backgroundPrimary
            case .accentedAlternative: .textPrimary
        }
    }
}
