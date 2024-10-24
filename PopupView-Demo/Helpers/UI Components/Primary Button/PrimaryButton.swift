//
//  PrimaryButton.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 23.10.2024.
//

import SwiftUI

struct PrimaryButton: View, Configurable {
    private var config: Config = .init()
    let text: String
    let action: () -> ()

    init(_ text: String, action: @escaping () -> ()) {
        self.text = text
        self.action = action
    }
    var body: some View {
        Button(action: action, label: createButtonLabel).buttonStyle(Style())
    }
}

private extension PrimaryButton {
    func createButtonLabel() -> some View {
        createBody()
            .frame(maxWidth: .infinity)
            .frame(width: config.width.value, height: config.height)
            .rectangleBackground(config.backgroundColor, config.cornerRadius)
    }
}

private extension PrimaryButton {
    func createBody() -> some View {
        Text(text)
            .font(config.appearance.font)
            .foregroundColor(config.appearance.textColour)
            .animation(nil, value: text)
    }
}

//MARK: - Configurable Data
extension PrimaryButton {
    @MainActor struct Config {
        var appearance: Appearance = .accented
        var width: Width = .full
        var height: CGFloat { appearance.height }
        var cornerRadius: CGFloat { appearance.cornerRadius }
        var backgroundColor: Color { appearance.backgroundColor }
    }

    func setWidth(to width: Width) -> Self { configure(path: \.config.width, width) }
    func changeAppearance(to appearance: Appearance) -> Self { configure(path: \.config.appearance, appearance) }
}

// MARK: - Style
fileprivate extension PrimaryButton {
    struct Style: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? 0.99 : 1)
                .saturation(configuration.isPressed ? 0.5 : 1)
        }
    }
}
