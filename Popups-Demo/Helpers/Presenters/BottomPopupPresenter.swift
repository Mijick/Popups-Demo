//
//  BottomPopupPresenter.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 30.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

@MainActor struct BottomPopupPresenter {
    let card: BottomCardType
    
    init?(_ card: CardType) {
        guard let card = card as? BottomCardType else { return nil }
        self.card = card
    }
}

extension BottomPopupPresenter {
    func present() {
        switch card {
            case .autoDismiss: presentAutoDismiss()
            case .autoHeight:  presentAutoHeight()
            case .dragDetent: presentDragDetent()
            case .fullscreen: presentFullscreen()
            case .large: presentLarge()
            case .noOverlay: presentNoOverlay()
            case .paddings: presentPaddings()
            case .scrollable: presentScrollable()
            case .stack: presentStackFlow()
            case .textField: presentTextField()
        }
    }
}

// MARK: Auto Dismiss
private extension BottomPopupPresenter {
    func presentAutoDismiss() {
        let viewModel = ViewModel()
            .setBottomPadding(24)
            .setHorizontalPaddings(12)
            .setBrandingAppearance(.compact)
            .setCornerRadius(23)
            .enableInteractions(false)
        
        BottomPopupView(viewModel)
            .dismissAfter(2)
            .present()
    }
}

// MARK: Auto Height
private extension BottomPopupPresenter {
    func presentAutoHeight() {
        BottomPopupView(.init()).present()
    }
}

// MARK: Drag Detent
private extension BottomPopupPresenter {
    func presentDragDetent() { // TODO: Check here
        let viewModel = ViewModel()
            .setDragPoints([.fraction(1.4), .large])
        
        BottomPopupView(viewModel).present()
    }
}

// MARK: Fullscreen
private extension BottomPopupPresenter {
    func presentFullscreen() {
        let viewModel = ViewModel()
            .setHeightMode(.fullscreen)
            .setButtons([.dismiss])
        
        BottomPopupView(viewModel).present()
    }
}

// MARK: Large
private extension BottomPopupPresenter {
    func presentLarge() {
        let viewModel = ViewModel()
            .setHeightMode(.large)
            .setButtons([.dismiss])
        
        BottomPopupView(viewModel).present()
    }
}

// MARK: No Overlay
private extension BottomPopupPresenter {
    func presentNoOverlay() {
        let viewModel = ViewModel()
            .setOverlayColor(.clear)
            .setBottomPadding(24)
            .setHorizontalPaddings(12)
            .setCornerRadius(23)
            .setBrandingAppearance(.compact)
        
        BottomPopupView(viewModel).present()
    }
}

// MARK: Paddings
private extension BottomPopupPresenter {
    func presentPaddings() {
        let viewModel = ViewModel()
            .setBottomPadding(8)
            .setHorizontalPaddings(8)
        
        BottomPopupView(viewModel).present()
    }
}

// MARK: Scrollable
private extension BottomPopupPresenter {
    func presentScrollable() {
        let viewModel = ViewModel()
            .isShowTextView(true)
            .setHeight(393)
        BottomPopupView(viewModel).present()
    }
}

// MARK: Text Field
private extension BottomPopupPresenter {
    func presentTextField() {
        let viewModel = ViewModel()
            .isShowTextField(true)
            .setButtons([.dismiss])
        
        BottomPopupView(viewModel).present()
    }
}

// MARK: Stack Flow
private extension BottomPopupPresenter {
    func presentStackFlow() {
        let viewModel = ViewModel()
            .setButtons([.presentNextPopup(present2Stack), .dismiss])
        
        BottomPopupView(viewModel).present()
    }
    func present2Stack() {
        let viewModel = ViewModel()
            .setButtons([.presentNextPopup(present3Stack), .dismiss])
            .setSpacerHeight(92)
        
        BottomPopupView(viewModel)
            .setCustomID("2StackBottomPopup")
            .present()
    }
    func present3Stack() {
        let viewModel = ViewModel()
            .setHeightMode(.large)
            .setButtons([.presentNextPopup(present4Stack), .dismiss])
        
        BottomPopupView(viewModel)
            .setCustomID("3StackBottomPopup")
            .present()
    }
    func present4Stack() {
        let viewModel = ViewModel()
            .setHeightMode(.fullscreen)
            .setButtons([.dismiss])
        
        BottomPopupView(viewModel)
            .setCustomID("4StackBottomPopup")
            .present()
    }
}

// MARK: Typealiases
private extension BottomPopupPresenter {
    typealias ViewModel = BottomPopupView.ViewModel
}
