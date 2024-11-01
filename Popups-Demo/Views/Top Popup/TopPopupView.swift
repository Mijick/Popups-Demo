//
//  TopPopupView.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 29.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI
import MijickPopups

struct TopPopupView: TopPopup {
    @ObservedObject private var viewModel: ViewModel
    
    init(_ viewModel: ViewModel) { self.viewModel = viewModel }
    
    var body: some View {
        VStack(spacing: 0) {
            createBrandingContent()
            createSpacer()
            createTextField()
            createButtons()
            createDragIndicator()
        }
        .padding(.horizontal, viewModel.horizontalPadding)
    }
    func configurePopup(config: TopPopupConfig) -> TopPopupConfig {
        config
            .dragDetents(viewModel.dragPoints)
            .cornerRadius(viewModel.cornerRadius)
            .popupHorizontalPadding(viewModel.popupHorizontalPadding)
            .popupTopPadding(viewModel.popupTopPadding)
            .overlayColor(viewModel.overlayColor)
            .heightMode(viewModel.heightMode)
    }
}

private extension TopPopupView {
    func createBrandingContent() -> some View {
        BrandingContent()
            .setAppearance(viewModel.brandingAppearance)
            .padding(.top, viewModel.topPadding)
            .padding(.bottom, viewModel.bottomPadding)
    }
    @ViewBuilder func createSpacer() -> some View {
        if viewModel.showSpacer { Spacer() }
    }
    func createTextField() -> some View {
        PrimaryTextField()
            .padding(.bottom, 12)
            .padding(.top, 24)
            .active(if: viewModel.showTextField)
    }
    func createButtons() -> some View {
        VStack(spacing: 8) {
            ForEach(viewModel.buttons, id: \.title, content: createButton)
        }
        .padding(.bottom, 20)
        .active(if: !viewModel.buttons.isEmpty)
    }
    func createDragIndicator() -> some View {
        DragIndicator()
            .padding(.top, 12)
            .padding(.bottom, 16)
            .active(if: !viewModel.dragPoints.isEmpty)
    }
}

private extension TopPopupView {
    func createButton(_ button: Buttons) -> some View {
        button
            .getView()
            .setHeight(to: viewModel.buttonHeight)
    }
}
