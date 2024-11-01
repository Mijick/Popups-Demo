//
//  Font++.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension Font {
    init(_ weight: Font.Weight, size: CGFloat) {
        switch weight {
            case .regular, .light, .thin, .ultraLight: self = .regular(size)
            default: self = .bold(size)
        }
    }
}

 extension Font {
    static func bold(_ size: CGFloat) -> Font { .custom("Inter-Bold", size: size) }
    static func regular(_ size: CGFloat) -> Font { .custom("Inter-Regular", size: size) }
}
