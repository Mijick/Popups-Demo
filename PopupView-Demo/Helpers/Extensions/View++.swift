//
//  View++.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension View {
    @ViewBuilder func active(if condition: Bool) -> some View {
        if condition { self }
    }
}
extension View {
    func frame(_ size: CGFloat) -> some View { frame(width: size, height: size, alignment: .center) }
    func font(_ type: CustomFont) -> some View { ModifiedContent(content: self, modifier: type) }
}
extension View {
    func alignHorizontally(_ alignment: HorizontalAlignment, _ value: CGFloat = 0) -> some View {
        HStack(spacing: 0) {
            Spacer.width(alignment == .leading ? value : nil)
            self
            Spacer.width(alignment == .trailing ? value : nil)
        }
    }
}

extension View {
    func rectangleBackground(_ color: Color, _ radius: CGFloat, borderColor: Color? = nil) -> some View {
        self.background {
            RoundedRectangle(cornerRadius: radius)
                .stroke(borderColor ?? .clear, lineWidth: 1)
                .background { RoundedRectangle(cornerRadius: radius).fill(color) }
        }
    }
}
