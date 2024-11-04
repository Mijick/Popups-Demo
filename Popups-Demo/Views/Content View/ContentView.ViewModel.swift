//
//  ContentView.ViewModel.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 30.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI

extension ContentView {
    class ViewModel { }
}

extension ContentView.ViewModel {
    @MainActor func onCardTap(_ card: CardType) {
        switch card {
            case let item as TopCardType: presentTopPopup(item)
            case let item as CentreCardType: presentCentrePopup(item)
            case let item as BottomCardType: presentBottomPopup(item)
            default: break
        }
    }
    func getEvenElements(_ cards: [CardType]) -> [CardType] {
        cards.enumerated()
            .filter { $0.offset.isMultiple(of: 2) }
            .map { $0.element }
    }
    func getOddElements(_ cards: [CardType]) -> [CardType] {
        cards.enumerated()
            .filter { !$0.offset.isMultiple(of: 2) }
            .map { $0.element }
    }
    @MainActor func countCardWidth() -> CGFloat {
        let paddings = horizontalPadding * 2
        let contentWidth = Screen.width - paddings - itemsDistance
        let cardWidth = contentWidth / 2
        return cardWidth
    }
}

extension ContentView.ViewModel {
    var topItems: [CardType] { TopCardType.allCases }
    var centreItems: [CardType] { CentreCardType.allCases }
    var bottomItems: [CardType] { BottomCardType.allCases }
}

extension ContentView.ViewModel {
    var horizontalPadding: CGFloat { 16 }
    var itemsDistance: CGFloat { 12 }
}

// MARK: Centre Popup
private extension ContentView.ViewModel {
    @MainActor func presentCentrePopup(_ card: CentreCardType) {
        switch card {
            case .alert: Centre_AlertPopup().present()
            case .stack: Centre_Stack1Popup().present()
            case .textField: Centre_TextFiledPopup().present()
            case .resizable: Centre_ResizablePopup().present()
        }
    }
    @MainActor func presentTopPopup(_ card: TopCardType) {
        switch card {
            case .autoHeight: Top_AutoHeightPopup().present()
            case .stack: Top_Stack1Popup().present()
            case .textField: Top_TextFieldPopup().present()
            case .dragDetent: Top_DragDetentPopup().present()
            case .fullscreen: Top_FullscreenPopup().present()
            case .fullscreenTextField: Top_FullscreenTextFiledPopup().present()
            case .paddings: Top_PaddingsPopup().present()
            case .variousOverlays: Top_OverlayPopup(step: .blue).present()
        }
    }
    @MainActor func presentBottomPopup(_ card: BottomCardType) {
        switch card {
            case .autoHeight: Bottom_AutoHeightPopup().present()
            case .stack: Bottom_Stack1Popup().present()
            case .dragDetent: Bottom_DragDetentPopup().present()
            case .textField: Bottom_TextFieldPopup().present()
            case .scrollable: Bottom_ScrollablePopup().present()
            case .paddings: Bottom_PaddingsPopup().present()
            case .autoDismiss: Bottom_AutoDismissPopup().dismissAfter(2).present()
            case .large: Bottom_LargePopup().present()
            case .fullscreen: Bottom_FullscreenPopup().present()
            case .noOverlay: Bottom_NoOverlayPopup().present()
        }
    }
}


