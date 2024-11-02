//
//  BottomPopupView.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 30.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//    - Mail: team@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI
import MijickPopups

struct BottomPopupView: BottomPopup {
    @ObservedObject private var viewModel: ViewModel
    
    init(_ viewModel: ViewModel) { self.viewModel = viewModel }
    
    var body: some View {
        VStack(spacing: 0) {
            createDragIndicator()
            createBrandingContent()
            createSpacer()
            createTextField()
            createText()
            createButtons()
        }
        .padding(.horizontal, viewModel.horizontalPadding)
        .addScrollView(if: viewModel.isActiveScrolling)
        .frame(height: viewModel.customHeight)
    }
    func configurePopup(config: BottomPopupConfig) -> BottomPopupConfig {
        config
            .ignoreSafeArea(edges: viewModel.ignoreSafeArea)
            .dragDetents(viewModel.dragPoints)
            .cornerRadius(viewModel.cornerRadius)
            .popupHorizontalPadding(viewModel.popupHorizontalPadding)
            .popupBottomPadding(viewModel.popupBottomPadding)
            .heightMode(viewModel.heightMode)
            .enableDragGesture(viewModel.isAvailableDragGesture)
            .tapOutsideToDismissPopup(viewModel.isAvailableInteractions)
            .overlayColor(viewModel.overlayColor)
    }
}

private extension BottomPopupView {
    func createDragIndicator() -> some View {
        DragIndicator()
            .padding(.top, 12)
            .active(if: viewModel.isActiveDragIndicator)
    }
    func createBrandingContent() -> some View {
        BrandingContent()
            .setAppearance(viewModel.brandingAppearance)
            .padding(.bottom, viewModel.brandingBottomPadding)
            .padding(.top, viewModel.brandingTopPadding)
    }
    func createSpacer() -> some View {
        Spacer
            .height(viewModel.spacerHeight)
            .active(if: viewModel.showSpacer)
    }
    func createTextField() -> some View {
        PrimaryTextField()
            .padding(.bottom, -8)
            .padding(.top, 12)
            .active(if: viewModel.showTextField)
    }
    func createText() -> some View {
        Text(viewModel.text)
            .multilineTextAlignment(.center)
            .font(.small(.regular))
            .foregroundStyle(Color.textSecondary)
            .padding(.top, 20)
            .padding(.bottom, 20)
            .padding(.horizontal, 12)
            .active(if: viewModel.showTextView)
    }
    func createButtons() -> some View {
        VStack(spacing: 8) {
            ForEach(viewModel.buttons, id: \.title, content: createButton)
        }
        .padding(.top, 16)
        .padding(.bottom, 8)
        .active(if: !viewModel.buttons.isEmpty)
    }
}

private extension BottomPopupView {
    func createButton(_ button: Buttons) -> some View {
        button
            .getView()
            .setHeight(to: .big)
    }
}
