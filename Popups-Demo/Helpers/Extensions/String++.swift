//
//  String++.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 29.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//


import SwiftUI

extension String {
    func camelCaseToKebabCase() -> String {
        unicodeScalars
            .dropFirst()
            .reduce(String(prefix(1))) { CharacterSet.uppercaseLetters.contains($1) ? $0 + "-" + String($1) : $0 + String($1) }
            .lowercased()
    }
}
