//
//  CenterPopupPresenter.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 28.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import Foundation

@MainActor struct CenterPopupPresenter {
    let card: CentreCardType
    
    init?(_ card: CardType) {
        guard let card = card as? CentreCardType else { return nil }
        self.card = card
    }
}

extension CenterPopupPresenter {
    func present() {
        switch card {
            case .alert: presentAlertPopup()
            case .resizable: presentResizablePopup()
            case .textField: presentTextFieldPopup()
            case .stack: presentStackFlowPopup()
        }
    }
}

// MARK: Alert
private extension CenterPopupPresenter {
    func presentAlertPopup() {
        let viewModel = ViewModel()
            .setButtonAppearance(.horizontal)
            .setButtons([.openGitHub, .dismiss])
        
        CentrePopupView(viewModel).present()
    }
}

// MARK: Resizable
private extension CenterPopupPresenter {
    func presentResizablePopup() {
        let viewModel = ViewModel()
        viewModel.setButtons([.makeBigger(viewModel.changeSize), .dismiss])
        
        CentrePopupView(viewModel).present()
    }
}

// MARK: Text Field
private extension CenterPopupPresenter {
    func presentTextFieldPopup() {
        let viewModel = ViewModel()
            .showTextField(true)
            .setButtons([.openGitHub, .dismiss])
        
        CentrePopupView(viewModel).present()
    }
}

// MARK: Stack
private extension CenterPopupPresenter {
    func presentStackFlowPopup() {
        let viewModel = ViewModel()
        viewModel.setButtons([.presentNextPopup(presentSecondStackPopup), .dismiss])
        
        CentrePopupView(viewModel).present()
    }
}
private extension CenterPopupPresenter {
    func presentSecondStackPopup() {
        let viewModel = ViewModel()
            .setButtons([.openGitHub, .dismiss])
            .showTextView(true)
        
        CentrePopupView(viewModel)
            .setCustomID("SecondCentrePopupStack")
            .present()
    }
}

// MARK: Typealiases
private extension CenterPopupPresenter {
    typealias ViewModel = CentrePopupView.ViewModel
}
