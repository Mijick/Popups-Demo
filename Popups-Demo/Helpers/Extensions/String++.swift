//
//  String++.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension String {
    func camelCaseToKebabCase() -> String {
        unicodeScalars
            .dropFirst()
            .reduce(String(prefix(1))) { CharacterSet.uppercaseLetters.contains($1) ? $0 + "-" + String($1) : $0 + String($1) }
            .lowercased()
    }
}
