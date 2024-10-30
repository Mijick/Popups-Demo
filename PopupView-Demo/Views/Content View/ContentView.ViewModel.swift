//
//  ContentView.ViewModel.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 30.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI

extension ContentView {
    @MainActor class ViewModel: ObservableObject { }
}

extension ContentView.ViewModel {
    @MainActor func onCardTap(_ card: CardType) {
        switch card {
            case let item where item is TopCardType: TopPopupPresenter(item)?.present()
            case let item where item is CentreCardType: CenterPopupPresenter(item)?.present()
            case let item where item is BottomCardType: BottomPopupPresenter(item)?.present()
            default: break
        }
    }
    func getEvenElements(_ cards: [CardType]) -> [CardType] {
        cards.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }
    }
    func getOddElements(_ cards: [CardType]) -> [CardType] {
        cards.enumerated().filter { $0.offset % 2 != 0 }.map { $0.element }
    }
}

extension ContentView.ViewModel {
    var topItems: [CardType] { TopCardType.allCases }
    var centreItems: [CardType] { CentreCardType.allCases }
    var bottomItems: [CardType] { BottomCardType.allCases }
}

extension ContentView.ViewModel {
    var cardWidth: CGFloat { (Screen.width - (horizontalPadding * 2) - itemsDistance) / 2 }
    var horizontalPadding: CGFloat { 16 }
    var itemsDistance: CGFloat { 12 }
}
