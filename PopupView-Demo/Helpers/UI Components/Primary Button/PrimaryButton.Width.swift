//
//  PrimaryButton.Width.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 23.10.2024.
//

import SwiftUI

extension PrimaryButton {
    @MainActor enum Width { case full, narrow(CGFloat), flexible }
}

extension PrimaryButton.Width {
    var value: CGFloat? {
        switch self {
            case .full: return Screen.width
            case .narrow(let value): return value
            case .flexible: return nil
        }
    }
}
