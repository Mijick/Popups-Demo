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
    static func interBold(_ size: CGFloat) -> Font { .custom("Inter-Bold", size: size) }
    static func interSemiBold(_ size: CGFloat) -> Font { .custom("Inter-SemiBold", size: size) }
    static func interRegular(_ size: CGFloat) -> Font { .custom("Inter-Regular", size: size) }

    static func satoshiBlack(_ size: CGFloat) -> Font { .custom("Satoshi-Black", size: size) }
    static func satoshiBold(_ size: CGFloat) -> Font { .custom("Satoshi-Bold", size: size) }
    static func satoshiRegular(_ size: CGFloat) -> Font { .custom("Satoshi-Regular", size: size) }

    static func openSansBold(_ size: CGFloat) -> Font { .custom("OpenSans-Bold", size: size) }
    static func openSansRegular(_ size: CGFloat) -> Font { .custom("OpenSans-Regular", size: size) }

    static func spaceGrotesk(_ size: CGFloat) -> Font { .custom("SpaceGrotesk-Bold", size: size) }
}
