//
//  PrimaryButton.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 23.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
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
            .frame(height: config.height.value)
            .rectangleBackground(config.backgroundColor, config.cornerRadius)
    }
}

private extension PrimaryButton {
    func createBody() -> some View {
        Text(text)
            .font(config.height.font)
            .foregroundColor(config.appearance.textColour)
            .animation(nil, value: text)
    }
}

//MARK: - Configurable Data
extension PrimaryButton {
    @MainActor struct Config {
        var appearance: Appearance = .accented
        var height: Height = .big
        var cornerRadius: CGFloat { height.cornerRadius }
        var backgroundColor: Color { appearance.backgroundColor }
    }

    func setHeight(to height: Height) -> Self { configure(path: \.config.height, height) }
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
