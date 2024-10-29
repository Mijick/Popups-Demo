//
//  PrimaryButton.Width.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 23.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI

extension PrimaryButton {
    @MainActor enum Width { case full, narrow(CGFloat), flexible }
}

extension PrimaryButton.Width {
    var value: CGFloat? {
        switch self {
            case .full: Screen.width
            case .narrow(let value): value
            case .flexible: nil
        }
    }
}
