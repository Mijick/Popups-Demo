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

private extension ContentView.ViewModel {
    @MainActor func presentCentrePopup(_ card: CentreCardType) { Task {
        switch card {
            case .alert: await Centre_AlertPopup().present()
            case .stack: await Centre_Stack1Popup().present()
            case .textField: await Centre_TextFiledPopup().present()
            case .resizable: await Centre_ResizablePopup().present()
        }
    }}
    @MainActor func presentTopPopup(_ card: TopCardType) { Task {
        switch card {
            case .autoHeight: await Top_AutoHeightPopup().present()
            case .stack: await Top_Stack1Popup().present()
            case .textField: await Top_TextFieldPopup().present()
            case .dragDetent: await Top_DragDetentPopup().present()
            case .fullscreen: await Top_FullscreenPopup().present()
            case .fullscreenTextField: await Top_FullscreenTextFiledPopup().present()
            case .paddings: await Top_PaddingsPopup().present()
            case .variousOverlays: await Top_OverlayPopup(step: .blue).present()
        }
    }}
    @MainActor func presentBottomPopup(_ card: BottomCardType) { Task {
        switch card {
            case .autoHeight: await Bottom_AutoHeightPopup().present()
            case .stack: await Bottom_Stack1Popup().present()
            case .dragDetent: await Bottom_DragDetentPopup().present()
            case .textField: await Bottom_TextFieldPopup().present()
            case .scrollable: await Bottom_ScrollablePopup().present()
            case .paddings: await Bottom_PaddingsPopup().present()
            case .autoDismiss: await Bottom_AutoDismissPopup().dismissAfter(2).present()
            case .large: await Bottom_LargePopup().present()
            case .fullscreen: await Bottom_FullscreenPopup().present()
            case .noOverlay: await Bottom_NoOverlayPopup().present()
        }
    }}
}


