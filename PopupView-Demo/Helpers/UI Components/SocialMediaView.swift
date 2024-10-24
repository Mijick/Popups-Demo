//
//  SocialMediaView.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 23.10.2024.
//

import SwiftUI

struct SocialMediaView: View {
    var body: some View {
        HStack(spacing: 4) {
            ForEach(Social.allCases, id: \.self, content: createButton)
        }
    }
}

private extension SocialMediaView {
    func createButton(_ item: Social) -> some View {
        ButtonIcon(image: item.image) { onTap(item) }
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
            case .medium: URL(string: "https://medium.com/@mijick")!
            case .discord: URL(string: "https://discord.gg/KRnz6HN6")!
            case .github: URL(string: "https://github.com/Mijick")!
        }
    }
}
