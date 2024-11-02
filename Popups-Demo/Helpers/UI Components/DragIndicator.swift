//
//  DragIndicator.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 29.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI

struct DragIndicator: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 42)
            .fill(Color.borderSecondary)
            .frame(width: 40, height: 4, alignment: .center)
    }
}
