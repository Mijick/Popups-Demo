//
//  CentrePopupView.ViewModel.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 28.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI
import MijickPopups

extension CentrePopupView {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var topPadding: CGFloat = 28
        @Published private(set) var bottomPadding: CGFloat = 20
        @Published private(set) var buttons: [Buttons] = [.openGitHub, .dismiss]
        @Published private(set) var buttonsAppearance: ButtonAppearance = .vertical
        @Published private(set) var showTextView = false
        @Published private(set) var showTextField = false
    }
}

extension CentrePopupView.ViewModel {
    func changeSize() {
        topPadding += 60
        bottomPadding += 60
    }
}

extension CentrePopupView.ViewModel {
    func setButtons(_ value: [Buttons]) { buttons = value }
    func setButtonAppearance(_ value: CentrePopupView.ButtonAppearance) { buttonsAppearance = value }
    func showTextView(_ value: Bool) { showTextView = value }
    func showTextField(_ value: Bool) { showTextField = value }
}

extension CentrePopupView.ViewModel {
    var textContent: String { "Nisi aliquip quis quis exercitation irure exercitation occaecat qui duis nisi. Labore elit duis excepteur et cupidatat qui deserunt ipsum reprehenderit." }
}
