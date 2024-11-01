//
//  ScrollViewModifier.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 30.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI

struct ScrollViewModifier: ViewModifier {
    let isAvailableScrolling: Bool
    
    init(_ isAvailableScrolling: Bool) { self.isAvailableScrolling = isAvailableScrolling }
    
    func body(content: Content) -> some View { wrap(content) }
}

private extension ScrollViewModifier {
    @ViewBuilder func wrap(_ content: Content) -> some View {
        if isAvailableScrolling { ScrollView(showsIndicators: true) { content } }
        else { content }
    }
}
