//
//  View++.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 29.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//


import SwiftUI

extension View {
    @ViewBuilder func active(if condition: Bool) -> some View {
        if condition { self }
    }
}
extension View {
    func frame(_ size: CGFloat) -> some View { frame(width: size, height: size, alignment: .center) }
    func font(_ type: CustomFont) -> some View { ModifiedContent(content: self, modifier: type) }
    func addScrollView(if condition: Bool) -> some View { ModifiedContent(content: self, modifier: ScrollViewModifier(condition)) }
    func toAnyView() -> AnyView { .init(self) }
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
