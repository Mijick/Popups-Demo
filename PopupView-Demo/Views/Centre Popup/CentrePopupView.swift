//
//  CentrePopupView.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 25.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI
import MijickPopups

struct CentrePopupView: CentrePopup {
    @StateObject private var viewModel: ViewModel
    
    init(_ viewModel: ViewModel = .init()) { _viewModel = .init(wrappedValue: viewModel) }
    
    var body: some View {
        VStack(spacing: 0) {
            brandingContent()
            createTextField()
            createText()
            createButtons()
        }
        .padding(.horizontal, 32)
        .padding(.top, viewModel.topPadding)
        .padding(.bottom, viewModel.bottomPadding)
    }
}

private extension CentrePopupView {
    func brandingContent() -> some View {
        BrandingContent()
            .isVisibleSocialMediaButtons(false)
            .padding(.bottom, 24)
    }
    func createTextField() -> some View {
        PrimaryTextField()
            .padding(.bottom, 12)
            .active(if: viewModel.showTextField)
    }
    func createText() -> some View {
        Text(viewModel.textContent)
            .multilineTextAlignment(.center)
            .font(.small(.regular))
            .foregroundStyle(Color.textSecondary)
            .padding(.bottom, 16)
            .active(if: viewModel.showTextView)
    }
    @ViewBuilder func createButtons() -> some View {
        switch viewModel.buttonsAppearance {
            case .horizontal: createHorizontalButtons()
            case .vertical: createVerticalButtons()
        }
    }
}

private extension CentrePopupView {
    func createHorizontalButtons() -> some View {
        HStack(spacing: 8) {
            ForEach(viewModel.buttons, id: \.title, content: createButton)
        }
    }
    func createVerticalButtons() -> some View {
        VStack(spacing: 8) {
            ForEach(viewModel.buttons, id: \.title, content: createButton)
        }
    }
}

private extension CentrePopupView {
    func createButton(_ item: Buttons) -> some View {
        item
            .getView()
            .setHeight(to: .small)
    }
}
