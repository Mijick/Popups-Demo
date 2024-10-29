//
//  CentreCardType.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 24.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

enum CentreCardType: String, CardType, CaseIterable {
    case alert, stack, textField, resizable
}

extension CentreCardType {
    var imageNamePrefix: String { "centre-" }
    var tags: [Tag] { [.centrePopup] }
}

extension CentreCardType {
    var title: String {
        switch self {
            case .resizable: "Resizable"
            case .stack: "Stack"
            case .textField: "Text Field"
            case .alert: "Alert"
        }
    }
}

extension CentreCardType {
    var description: String {
        switch self {
            case .resizable: ""
            case .stack: ""
            case .textField: ""
            case .alert: ""
        }
    }
}
