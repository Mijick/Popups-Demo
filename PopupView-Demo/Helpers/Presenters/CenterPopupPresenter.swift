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
        viewModel.setButtonAppearance(.horizontal)
        viewModel.setButtons([.openGitHub, .dismiss])
        
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
        viewModel.showTextField(true)
        viewModel.setButtons([.openGitHub, .dismiss])
        
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
        viewModel.setButtons([.openGitHub, .dismiss])
        viewModel.showTextView(true)
        
        CentrePopupView(viewModel)
            .setCustomID("SecondCentrePopupStack")
            .present()
    }
}

// MARK: Typealiases
private extension CenterPopupPresenter {
    typealias ViewModel = CentrePopupView.ViewModel
}
