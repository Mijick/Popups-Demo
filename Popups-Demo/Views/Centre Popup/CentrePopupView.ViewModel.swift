//
//  CentrePopupView.ViewModel.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 28.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI
import MijickPopups

extension CentrePopupView {
    @MainActor class ViewModel: ObservableObject, ClassConfigurable {
        @Published var topPadding: CGFloat = 28
        @Published var bottomPadding: CGFloat = 20
        var buttons: [Buttons] = []
        var buttonsAppearance: ButtonAppearanceDirection = .vertical
        var showTextView = false
        var showTextField = false
    }
}

extension CentrePopupView.ViewModel {
    func changeSize() {
        topPadding += 60
        bottomPadding += 60
    }
}

extension CentrePopupView.ViewModel {
    @discardableResult func setButtons(_ value: [Buttons]) -> Self { configure(path: \.buttons, value) }
    func setButtonAppearance(_ value: CentrePopupView.ButtonAppearanceDirection) -> Self { configure(path: \.buttonsAppearance, value) }
    func showTextView(_ value: Bool) -> Self { configure(path: \.showTextView, value) }
    func showTextField(_ value: Bool) -> Self { configure(path: \.showTextField, value) }
}

extension CentrePopupView.ViewModel {
    var textContent: String { "Nisi aliquip quis quis exercitation irure exercitation occaecat qui duis nisi. Labore elit duis excepteur et cupidatat qui deserunt ipsum reprehenderit." }
}
