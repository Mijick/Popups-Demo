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
    let image: ImageResource
    let onAction: () -> Void
 
    var body: some View {
        Button(action: onAction, label: createLabel)
    }
}

private extension ButtonIcon {
    func createLabel() -> some View {
        Icon(image, size: 20, color: .textPrimary)
            .padding(10)
            .rectangleBackground(.backgroundTertiary, 13)
    }
}
