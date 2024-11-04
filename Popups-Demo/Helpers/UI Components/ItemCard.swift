//
//  ItemCard.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 23.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI

struct ItemCard: View {
    let card: CardType
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            createIcon()
            Spacer.height(16)
            createTitle()
            Spacer.height(2)
            createDescription()
            Spacer.height(12)
            createTags()
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
        .padding(.top, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .rectangleBackground(.backgroundSecondary50, 12, borderColor: .borderTertiary)
    }
}

private extension ItemCard {
    func createIcon() -> some View {
        card.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40)
    }
    func createTitle() -> some View {
        Text(card.title)
            .font(.medium)
            .foregroundStyle(Color.textPrimary)
    }
    func createDescription() -> some View {
        Text(card.description)
            .font(.smallRegular)
            .foregroundStyle(Color.textSecondary)
    }
    func createTags() -> some View {
        Text(tags)
            .font(.smallRegular)
            .foregroundStyle(Color.textBrand)
    }
}

private extension ItemCard {
    var tags: String {
        card.tags
            .map { "#" + $0.rawValue }
            .joined(separator: ", ")
    }
}
