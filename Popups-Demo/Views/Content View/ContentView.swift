//
//  ContentView.swift 
//  Popups-Demo
//
//  Created by Alina Petrovska on 29.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//


import SwiftUI
import MijickPopups

struct ContentView: View {
    private var viewModel: ViewModel = .init()
    
    var body: some View {
        VStack(spacing: 0) {
            createHeader()
            createScrollableContent()
        }
        .padding(.horizontal, viewModel.horizontalPadding)
        .background(Color.backgroundPrimary)
    }
}

private extension ContentView {
    func createHeader() -> some View {
        HStack(spacing: 8) {
            createLogo()
            Spacer()
            createSocialMedia()
        }
        .padding(.top, 12)
        .padding(.bottom, 18)
    }
    func createScrollableContent() -> some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 40) {
                createSection(viewModel.bottomItems, section: "Bottom Popups")
                createSection(viewModel.centreItems, section: "Centre Popups")
                createSection(viewModel.topItems, section: "Top Popups")
            }
            .padding(.top, 18)
        }
    }
}

private extension ContentView {
    func createLogo() -> some View {
        Icon(.logo, size: 40)
    }
    func createSocialMedia() -> some View {
        SocialMediaView().configureButtonColor(.backgroundSecondary)
    }
    func createSection(_ cards: [CardType], section name: String) -> some View {
        VStack(alignment: .leading, spacing: 20) {
            createSectionHeader(name)
            createSectionContent(cards)
        }
    }
}

private extension ContentView {
    func createSectionHeader(_ name: String)  -> some View {
        Text(name)
            .font(.h5)
            .foregroundStyle(Color.textPrimary)
    }
    func createSectionContent(_ cards: [CardType]) -> some View {
        HStack(alignment: .top, spacing: viewModel.itemsDistance) {
            createSectionRows(viewModel.getEvenElements(cards))
            createSectionRows(viewModel.getOddElements(cards))
        }
    }
}

private extension ContentView {
    func createSectionRows(_ cards: [CardType]) -> some View {
        LazyVStack(alignment: .leading, spacing: viewModel.itemsDistance) {
            ForEach(cards, id: \.title, content: createRowItem)
        }
    }
}

private extension ContentView {
    func createRowItem(_ card: CardType) -> some View {
        ItemCard(card: card)
            .onTapGesture { viewModel.onCardTap(card) }
    }
}
