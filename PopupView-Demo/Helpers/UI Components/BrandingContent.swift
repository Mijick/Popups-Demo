//
//  BrandingContent.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 23.10.2024.
//

import SwiftUI

struct BrandingContent: View, Configurable {
    @State var isVisibleSocialMedia: Bool = true
    
    var body: some View {
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
        SocialMediaView()
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
    func changeSocialMediaVisibility(_ isVisible: Bool) -> Self { configure(path: \.isVisibleSocialMedia, isVisible) }
}
