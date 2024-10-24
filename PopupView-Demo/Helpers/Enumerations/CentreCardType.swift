//
//  CentreCardType.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 24.10.2024.
//

enum CentreCardType: String, CardType, CaseIterable {
    case resizable, stack, textField
}

extension CentreCardType {
    var imageNamePrefix: String { "centre-" }
    var tags: [Tag] { [.centrePopup] }
}

extension CentreCardType {
    var title: String {
        switch self {
            case .resizable: return "Resizable"
            case .stack: return "Stack"
            case .textField: return "Text Field"
        }
    }
}

extension CentreCardType {
    var description: String {
        switch self {
            case .resizable: return ""
            case .stack: return ""
            case .textField: return ""
        }
    }
}
