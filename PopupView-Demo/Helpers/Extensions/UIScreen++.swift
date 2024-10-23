//
//  UIScreen++.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

// MARK: -iOS & tvOS Implementation
#if os(iOS) || os(tvOS)
class Screen {
    @MainActor static var safeArea: UIEdgeInsets = UIScreen.safeArea
}
fileprivate extension UIScreen {
    static var safeArea: UIEdgeInsets {
        UIApplication.shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap(\.windows)
            .first(where: \.isKeyWindow)?
            .safeAreaInsets ?? .zero
    }
}


// MARK: - macOS Implementation
#elseif os(macOS)
class Screen {
    static var safeArea: NSEdgeInsets = NSScreen.safeArea
}
fileprivate extension NSScreen {
    static var safeArea: NSEdgeInsets =
    NSApplication.shared
        .mainWindow?
        .contentView?
        .safeAreaInsets ?? .init(top: 0, left: 0, bottom: 0, right: 0)
}
#endif
