//
//  TopPopupPresenter.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 29.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

@MainActor struct TopPopupPresenter {
    let card: TopCardType
    
    init?(_ card: CardType) {
        guard let card = card as? TopCardType else { return nil }
        self.card = card
    }
}

extension TopPopupPresenter {
    func present() {
        switch card {
            case .autoHeight: presentAutoHeight()
            case .dragDetent: presentDragDetent()
            case .fullscreenTextField: presentFullscreenTextField()
            case .textField: presentTextField()
            case .fullscreen: presentFullscreen()
            case .paddings: presentPaddings()
            case .stack: presentStackFlow()
            case .variousOverlays: presentOverlayFlow()
        }
    }
}

// MARK: Auto Height
private extension TopPopupPresenter {
    func presentAutoHeight() {
        let viewModel = ViewModel()
            .setBrandingAppearance(.compact)
            .setButtons([])
            .setCornerRadius(0)
        
        TopPopupView(viewModel).present()
    }
}

// MARK: Drag Detent
private extension TopPopupPresenter {
    func presentDragDetent() { // TODO: Check here
        let viewModel = ViewModel()
            .setDragPoints([.fraction(1.4), .large])
            .setButtons([.dismiss])
        
        TopPopupView(viewModel).present()
    }
}

// MARK: Fullscreen Text Field
private extension TopPopupPresenter {
    func presentFullscreenTextField() {
        let viewModel = ViewModel()
            .setButtons([.dismiss])
            .setHeightMode(.fullscreen)
            .isShowTextField(true)
            .setButtonHeight(.big)
        
        TopPopupView(viewModel).present()
    }
}

// MARK: Text Field
private extension TopPopupPresenter {
    func presentTextField() {
        let viewModel = ViewModel()
            .isShowTextField(true)
            .setCornerRadius(20)
            .setButtonHeight(.big)
            .setButtons([.dismiss])
        
        TopPopupView(viewModel).present()
    }
}

// MARK: Fullscreen
private extension TopPopupPresenter {
    func presentFullscreen() {
        let viewModel = ViewModel()
            .setButtons([.dismiss])
            .setHeightMode(.fullscreen)
            .setButtonHeight(.big)
        
        TopPopupView(viewModel).present()
    }
}

// MARK: Paddings
private extension TopPopupPresenter {
    func presentPaddings() {
        let viewModel = ViewModel()
            .setBrandingAppearance(.compact)
            .setPopupTopPadding(Screen.safeArea.top + 8)
            .setPopupHorizontalPaddings(12)
            .setCornerRadius(20)
        
        TopPopupView(viewModel).present()
    }
}

// MARK: Stack flow
private extension TopPopupPresenter {
    func presentStackFlow() {
        let viewModel = ViewModel()
            .setButtons([.presentNextPopup(present2Stack), .dismiss])
            .setBrandingAppearance(.compact)
            .setPopupTopPadding(Screen.safeArea.top)
            .setPopupHorizontalPaddings(12)
            .setCornerRadius(20)
        
        TopPopupView(viewModel).present()
    }
    func present2Stack() {
        let viewModel = ViewModel()
            .setButtons([.presentNextPopup(present3Stack), .dismiss])
            .setBrandingAppearance(.compact)
            .setCornerRadius(0)
        
        TopPopupView(viewModel)
            .setCustomID("2StackTopPopupView")
            .present()
    }
    func present3Stack() {
        let viewModel = ViewModel()
            .setButtons([.presentNextPopup(present4Stack), .dismiss])
        
        TopPopupView(viewModel)
            .setCustomID("3StackTopPopupView")
            .present()
    }
    func present4Stack() {
        let viewModel = ViewModel()
            .setButtons([.presentNextPopup(present5Stack), .close])
            .setButtonHeight(.big)
            .setHeightMode(.large)
        
        TopPopupView(viewModel)
            .setCustomID("4StackTopPopupView")
            .present()
    }
    func present5Stack() {
        let viewModel = ViewModel()
            .setButtons([.presentNextPopup(present6Stack), .close])
            .setButtonHeight(.big)
            .setHeightMode(.fullscreen)
        
        TopPopupView(viewModel)
            .setCustomID("5StackTopPopupView")
            .present()
    }
    func present6Stack() {
        let viewModel = ViewModel().setButtons([.dismiss])
        
        TopPopupView(viewModel)
            .setCustomID("6StackTopPopupView")
            .present()
    }
}

// MARK: Various Overlays flow
private extension TopPopupPresenter {
    func presentOverlayFlow() {
        let viewModel = ViewModel()
            .setButtons([.presentNextPopup(present2OverlayPopup), .dismiss])
            .setOverlayColor(.overlayBlue)
        
        TopPopupView(viewModel).present()
    }
    func present2OverlayPopup() {
        let viewModel = ViewModel()
            .setButtons([.presentNextPopup(present3OverlayPopup), .dismiss])
            .setOverlayColor(.overlayGreen)
        
        TopPopupView(viewModel)
            .setCustomID("2OverlayTopPopupView")
            .present()
    }
    func present3OverlayPopup() {
        let viewModel = ViewModel()
            .setButtons([.dismiss])
            .setOverlayColor(.overlayPurple)
        
        TopPopupView(viewModel)
            .setCustomID("3OverlayTopPopupView")
            .present()
    }
}


// MARK: Typealiases
private extension TopPopupPresenter {
    typealias ViewModel = TopPopupView.ViewModel
}
