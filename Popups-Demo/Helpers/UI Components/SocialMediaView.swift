//
//  SocialMediaView.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 23.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI

struct SocialMediaView: View, Configurable {
    private var buttonsColor: Color = .backgroundTertiary
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(Social.allCases, id: \.self, content: createButton)
        }
    }
}

private extension SocialMediaView {
    func createButton(_ item: Social) -> some View {
        ButtonIcon(buttonsColor, item.image) { onTap(item) }
    }
}

private extension SocialMediaView {
    func onTap(_ item: Social) {
        #if os(macOS)
            NSWorkspace.shared.open(item.link)
        #else
            UIApplication.shared.open(item.link)
        #endif
    }
}

// MARK: Configurable
extension SocialMediaView {
    func configureButtonColor(_ value: Color) -> Self { configure(path: \.buttonsColor, value)}
}

// MARK: Social Media
fileprivate enum Social: CaseIterable { case medium, discord, github }

extension Social {
    var image: ImageResource {
        switch self {
            case .medium: .medium
            case .discord: .discord
            case .github: .github
        }
    }
    var link: URL {
        switch self {
            case .medium: URL(string: "https://link.mijick.com/medium")!
            case .discord: URL(string: "https://link.mijick.com/discord")!
            case .github: URL(string: "https://link.mijick.com/github")!
        }
    }
}
