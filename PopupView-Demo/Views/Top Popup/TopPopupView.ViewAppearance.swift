//
//  TopPopupView.ViewAppearance.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 29.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI

extension TopPopupView {
    enum ViewAppearance { case compact, nonCompact }
}

extension TopPopupView.ViewAppearance {
    var topPadding: CGFloat { self == .compact ? 20 : 32 }
    var bottomPadding: CGFloat { 20 }
    var horizontalPadding: CGFloat { self == .compact ? 16 : 28 }
}
