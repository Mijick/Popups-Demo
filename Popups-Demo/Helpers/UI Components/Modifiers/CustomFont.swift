//
//  CustomFont.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 23.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI

struct CustomFont: ViewModifier {
    private let font: Font
    private let lineHeight: CGFloat
    private let fontHeight: CGFloat
    private let letterSpacing: CGFloat
    
    init(_ weight: Font.Weight, size: CGFloat, lineHeight: CGFloat, spacing: CGFloat) {
        self.font = .init(weight, size: size)
        self.lineHeight = lineHeight
        self.fontHeight = size
        self.letterSpacing = spacing
    }
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .tracking(letterSpacing)
            .lineSpacing(spacing)
            .padding(.vertical, padding)
    }
}

private extension CustomFont {
    var calculatedLineHeight: CGFloat { lineHeight - fontHeight - 3 }
    var spacing: CGFloat { calculatedLineHeight < 0 ? 0 : calculatedLineHeight }
    var padding: CGFloat { spacing / 2 }
}

// MARK: Header
extension CustomFont {
    static var h1: CustomFont { .init(.bold, size: 48, lineHeight: 58, spacing: -0.32) }
    static var h2: CustomFont { .init(.bold, size: 40, lineHeight: 48, spacing: -0.32) }
    static var h3: CustomFont { .init(.bold, size: 32, lineHeight: 38, spacing: -0.32) }
    static var h4: CustomFont { .init(.bold, size: 28, lineHeight: 32, spacing: -0.28) }
    static var h5: CustomFont { .init(.bold, size: 24, lineHeight: 28, spacing: -0.24) }
    static var h6: CustomFont { .init(.bold, size: 20, lineHeight: 24, spacing: -0.24) }
}

// MARK: Body
extension CustomFont {
    static var large: CustomFont { .init(.regular, size: 20, lineHeight: 32, spacing: -0.8) }
    static var medium: CustomFont { .init(.bold, size: 16, lineHeight: 24, spacing: -0.16) }
    static var tiny: CustomFont { .init(.regular, size: 8, lineHeight: 12, spacing: 0.16) }
}

extension CustomFont {
    static func small(_ weight: Font.Weight) -> CustomFont {
        .init(weight, size: 12, lineHeight: 20, spacing: weight == .bold ? 0 : 0.16)
    }
}
