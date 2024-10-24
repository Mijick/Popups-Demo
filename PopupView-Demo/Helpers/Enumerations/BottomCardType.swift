//
//  BottomCardType.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 24.10.2024.
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
            case .autoDismiss: return ""
            case .autoHeight: return ""
            case .dragDetent: return ""
            case .fullscreen: return ""
            case .large: return ""
            case .noOverlay: return ""
            case .paddings: return ""
            case .scrollable: return ""
            case .stack: return ""
            case .textField: return ""
        }
    }
}
