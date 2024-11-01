//
//  BottomCardType.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 24.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

enum BottomCardType: String, CardType, CaseIterable {
    case autoDismiss, autoHeight, dragDetent, fullscreen, large, noOverlay, paddings, scrollable, stack, textField
}

extension BottomCardType {
    var imageNamePrefix: String { "bottom-" }
    var tags: [Tag] { [.bottomPopup] }
}

extension BottomCardType {
    var title: String {
        switch self {
            case .autoDismiss: return "Auto Dismiss"
            case .autoHeight: return "Auto Height"
            case .dragDetent: return "Drag Detent"
            case .fullscreen: return "Fullscreen"
            case .large: return "Large"
            case .noOverlay: return "No Overlay"
            case .paddings: return "Paddings"
            case .scrollable: return "Scrollable"
            case .stack: return "Stack"
            case .textField: return "Text Field"
        }
    }
}

extension BottomCardType {
    var description: String {
        switch self {
            case .autoDismiss: return "A bottom popup appears at the bottom of the screen and automatically dismisses itself after 2 seconds"
            case .autoHeight: return "A bottom popup automatically adjusts its height based on the content within it"
            case .dragDetent: return "A bottom popup supports drag-and-drop interactions, allowing users to move or rearrange items within the popup"
            case .fullscreen: return "A bottom popup expands to fullscreen even if the content is minimal"
            case .large: return "A bottom popup expands to take up the entire height of the screen, even if the content is minimal"
            case .noOverlay: return "A bottom popup appears without an overlay color, allowing the underlying screen content to remain fully visible"
            case .paddings: return "A bottom popup appears with customizable padding from the screen edges"
            case .scrollable: return "A bottom popup view that supports scrollable content"
            case .stack: return "Allows to present several popup views arranged in a stacked formation to demonstrate layered popups"
            case .textField: return "A bottom popup view containing a text field, designed to demonstrate keyboard behavior upon activation"
        }
    }
}
