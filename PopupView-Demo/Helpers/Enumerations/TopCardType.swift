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
            case .autoHeight: return ""
            case .dragDetent: return ""
            case .fullscreenTextField: return ""
            case .fullscreen: return ""
            case .paddings: return ""
            case .stack: return ""
            case .textField: return ""
            case .variousOverlays: return ""
        }
    }
}
