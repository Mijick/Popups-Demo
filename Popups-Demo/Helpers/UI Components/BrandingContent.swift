//
//  BrandingContent.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 23.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI

struct BrandingContent: View, Configurable {
    private var isHiddenSocialMedia: Bool = false
    private var appearance: Appearance = .nonCompact
    
    var body: some View { createContent() }
}

private extension BrandingContent {
    @ViewBuilder func createContent() -> some View {
        switch appearance {
            case .compact: createCompactContent()
            case .nonCompact: createNonCompactContent()
        }
    }
}

private extension BrandingContent {
    func createCompactContent() -> some View {
        Icon(.logoClean, size: 60)
    }
    func createNonCompactContent() -> some View {
        VStack(spacing: 20) {
            createLogo()
            createMadeByContent()
            createSocialButtons()
        }
    }
}

private extension BrandingContent {
    func createLogo() -> some View {
        Icon(.logo, size: 64)
    }
    func createMadeByContent() -> some View {
        VStack(spacing: 4) {
            createTextView()
            createCompanyName()
        }
    }
    func createSocialButtons() -> some View {
        SocialMediaView().active(if: !isHiddenSocialMedia)
    }
}

private extension BrandingContent {
    func createTextView() -> some View {
        Text("made by")
            .font(.small(.regular))
            .foregroundStyle(Color.textSecondary)
    }
    func createCompanyName() -> some View {
        Icon(.companyName)
            .frame(height: 32)
    }
}

// MARK: Configuration
extension BrandingContent {
    func hideSocialMedia(_ isHidden: Bool) -> Self { configure(path: \.isHiddenSocialMedia, isHidden) }
    func setAppearance(_ value: Appearance) -> Self { configure(path: \.appearance, value) }
}

// MARK: Appearance
extension BrandingContent {
    enum Appearance { case compact, nonCompact }
}
