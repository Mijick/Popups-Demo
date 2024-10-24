//
//  PrimaryButton.Appearance.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 23.10.2024.
//

import SwiftUI

extension PrimaryButton {
    @MainActor enum Appearance { case accented, accentedAlternative, thinAccented, thinAccentedAlternative }
}

extension PrimaryButton.Appearance {
    var backgroundColor: Color {
        switch self {
            case .accented, .thinAccented: .backgroundInverted
            case .accentedAlternative, .thinAccentedAlternative: .backgroundTertiary
        }
    }
    var textColour: Color {
        switch self {
            case .accented, .thinAccented: .backgroundPrimary
            case .accentedAlternative, .thinAccentedAlternative: .textPrimary
        }
    }
    var cornerRadius: CGFloat {
        switch self {
            case .accented, .accentedAlternative: 14
            case .thinAccented, .thinAccentedAlternative: 9
        }
    }
    var font: CustomFont {
        switch self {
            case .accented, .accentedAlternative: .medium
            case .thinAccented, .thinAccentedAlternative: .small(.regular)
        }
    }
    var height: CGFloat {
        switch self {
            case .accented, .accentedAlternative: 56
            case .thinAccented, .thinAccentedAlternative: 36
        }
    }
}
