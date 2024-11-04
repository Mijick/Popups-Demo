//
//  ButtonIcon.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 23.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI

struct ButtonIcon: View {
    private var backgroundColor: Color
    private let image: ImageResource
    private let onAction: () -> Void
    
    init(_ backgroundColor: Color, _ image: ImageResource, _ onAction: @escaping () -> Void) {
        self.backgroundColor = backgroundColor
        self.image = image
        self.onAction = onAction
    }
 
    var body: some View {
        Button(action: onAction, label: createLabel)
            .buttonStyle(.plain)
    }
}

private extension ButtonIcon {
    func createLabel() -> some View {
        Icon(image, size: 20, color: .textPrimary)
            .padding(10)
            .rectangleBackground(backgroundColor, 13)
    }
}
