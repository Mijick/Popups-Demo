//
//  Buttons.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 25.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI
import MijickPopups

@MainActor enum Buttons {
    case presentNextPopup(() -> ()), dismiss, close, openGitHub, makeBigger(() -> ())
}

extension Buttons {
    func getView() -> PrimaryButton {
        PrimaryButton(title, action: action).changeAppearance(to: appearance)
    }
}

extension Buttons {
    var title: String {
        switch self {
            case .presentNextPopup: "Present next popup"
            case .dismiss: "Dismiss"
            case .close: "Close"
            case .openGitHub: "Open GitHub"
            case .makeBigger: "Make popup bigger"
        }
    }
}

extension Buttons {
    var action: () -> () {
        switch self {
            case .presentNextPopup(let action),
                 .makeBigger(let action): action
            case .dismiss, .close: onDismiss
            case .openGitHub: onOpenGitHub
        }
    }
    var appearance: PrimaryButton.Appearance {
        switch self {
            case .dismiss, .close: .accentedAlternative
            default: .accented
        }
    }
    var gitHub: URL { URL(string: "https://github.com/Mijick")! }
}

private extension Buttons {
    func onDismiss() { Task {
        PopupManager.dismissLastPopup()
    }}
    func onOpenGitHub() {
        #if os(macOS)
            NSWorkspace.shared.open(gitHub)
        #else
            UIApplication.shared.open(gitHub)
        #endif
    }
}
