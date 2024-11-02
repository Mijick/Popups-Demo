//
//  UIScreen++.swift 
//  Popups-Demo
//
//  Created by Alina Petrovska on 29.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//


import SwiftUI

// MARK: -iOS & tvOS Implementation
#if os(iOS) || os(tvOS)
@MainActor class Screen {
    static var safeArea: UIEdgeInsets = UIScreen.safeArea
    static var width: CGFloat { UIScreen.main.bounds.size.width }
    static var height: CGFloat { UIScreen.main.bounds.size.height }
}

private extension UIScreen {
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
@MainActor class Screen {
    static var safeArea: NSEdgeInsets = NSScreen.safeArea
    static var width: CGFloat { NSScreen.width }
    static var height: CGFloat { NSScreen.height }
}
fileprivate extension NSScreen {
    @MainActor static var safeArea: NSEdgeInsets =
    NSApplication.shared
        .mainWindow?
        .contentView?
        .safeAreaInsets ?? .init(top: 0, left: 0, bottom: 0, right: 0)
    
    @MainActor static var width: CGFloat {
        NSApplication.shared
            .mainWindow?
            .contentView?
            .frame.size.width ?? .zero
    }
    @MainActor static var height: CGFloat {
        NSApplication.shared
            .mainWindow?
            .contentView?
            .frame.size.height ?? .zero
    }
}
#endif
