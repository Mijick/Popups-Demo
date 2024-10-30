//
//  TopPopupView.swift
//  MijickPopups-Demo
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
        .padding(.top, viewModel.topPadding)
        .padding(.bottom, viewModel.bottomPadding)
    }
    func configurePopup(config: TopPopupConfig) -> TopPopupConfig {
        config
            .dragDetents(viewModel.dragPoints)
            .cornerRadius(viewModel.cornerRadius)
            .popupHorizontalPadding(viewModel.outerHorizontalPadding)
            .popupTopPadding(viewModel.outerTopPadding)
            .overlayColor(viewModel.overlayColor)
            .heightMode(viewModel.heightMode)
    }
}

private extension TopPopupView {
    func createBrandingContent() -> some View {
        BrandingContent()
            .setAppearance(viewModel.brandingAppearance)
            .padding(.bottom, 32)
    }
    @ViewBuilder func createSpacer() -> some View {
        if viewModel.showSpacer { Spacer.width(40).background(Color.red) }
    }
    func createTextField() -> some View {
        PrimaryTextField()
            .padding(.bottom, 12)
            .padding(.top, 12)
            .active(if: viewModel.showTextField)
    }
    func createButtons() -> some View {
        VStack(spacing: 8) {
            ForEach(viewModel.buttons, id: \.title, content: createButton)
        }
    }
    func createDragIndicator() -> some View {
        DragIndicator()
            .padding(.top, 24)
            .padding(.bottom, -4)
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
