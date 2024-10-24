//
//  TopCardType.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 24.10.2024.
//

enum TopCardType: String, CardType, CaseIterable {
    case autoHeight, dragDetent, fullscreenTextField, fullscreen, paddings, stack, textField, variousOverlays
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
