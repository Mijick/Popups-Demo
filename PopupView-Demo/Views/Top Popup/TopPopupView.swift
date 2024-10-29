//
//  TopPopupView.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 29.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.

import SwiftUI
import MijickPopups

struct TopPopupView: TopPopup {
    @ObservedObject private var viewModel: ViewModel
    
    init(_ viewModel: ViewModel) { self.viewModel = viewModel }
    
    var body: some View {
        VStack(spacing: 0) {
            createNonCompactBrandingContent()
            createCompactBrandingContent()
            createSpacer()
            createTextField()
            createButtons()
            createDragIndicator()
        }
        .padding(.horizontal, viewModel.appearance.horizontalPadding)
        .padding(.top, viewModel.appearance.topPadding)
        .padding(.bottom, viewModel.appearance.bottomPadding)
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
    func createNonCompactBrandingContent() -> some View {
        BrandingContent()
            .padding(.bottom, 32)
            .active(if: viewModel.appearance == .nonCompact)
    }
    func createCompactBrandingContent() -> some View {
        Icon(.logoClean, size: 60)
            .padding(.bottom, 24)
            .active(if: viewModel.appearance == .compact)
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
    func createButton(_ item: Buttons) -> some View {
        item
            .getView()
            .setHeight(to: viewModel.buttonHeight)
    }
}
