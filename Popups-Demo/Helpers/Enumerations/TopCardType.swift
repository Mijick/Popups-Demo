//
//  TopCardType.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 24.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

enum TopCardType: String, CardType, CaseIterable {
    case autoHeight, stack, textField, dragDetent, fullscreenTextField, fullscreen, paddings, variousOverlays
}

extension TopCardType {
    var imageNamePrefix: String { "top-" }
    var tags: [Tag] { [.topPopup] }
    
}

extension TopCardType {
    var title: String {
        switch self {
            case .autoHeight: return "Auto Height"
            case .dragDetent: return "Drag Detent"
            case .fullscreenTextField: return "Fullscreen with Text Field"
            case .fullscreen: return "Fullscreen"
            case .paddings: return "Paddings"
            case .stack: return "Stack"
            case .textField: return "Text Field"
            case .variousOverlays: return "Various Overlays"
        }
    }
}

extension TopCardType {
    var description: String {
        switch self {
            case .autoHeight: return "A top popup view that automatically adjusts its height based on the content within it."
            case .dragDetent: return "A top popup supports drag-and-drop interactions, allowing users to move or rearrange items within the popup"
            case .fullscreenTextField: return "A top popup that contains a text field, designed to demonstrate keyboard behavior upon activation"
            case .fullscreen: return "A top popup expands to fullscreen even if the content is minimal"
            case .paddings: return "A top popup appears with customizable padding from the screen edges"
            case .stack: return "Allows to present several popup views arranged in a stacked formation to demonstrate layered popups"
            case .textField: return "A top popup that contains a text field, designed to demonstrate keyboard behavior upon activation"
            case .variousOverlays: return "Provides an ability to present several popup views, each with its own specific overlay color."
        }
    }
}
