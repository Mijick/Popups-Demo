//
//  PrimaryTextField.swift
//  MijickPopups-Demo
//
//  Created by Alina Petrovska on 24.10.2024.
//

import SwiftUI

struct PrimaryTextField: View {
    @State private var text: String = ""
    let title: String
    let placeholder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            titleView()
            createContent()
        }
        .animation(.default, value: text)
    }
}

private extension PrimaryTextField {
    func titleView() -> some View {
        Text(title)
            .font(.small(.bold))
            .foregroundStyle(Color.textPrimary)
    }
    func createContent() -> some View {
        HStack(spacing: 8) {
            createIcon()
            createTextField()
        }
        .padding(12)
        .rectangleBackground(.backgroundTertiary, 10)
    }
}

private extension PrimaryTextField {
    func createIcon() -> some View {
        Icon(.textAlignLeft, size: 20, color: iconColor)
    }
    func createTextField() -> some View {
        TextField("", text: $text)
            .foregroundStyle(Color.textPrimary)
            .placeholder(when: text.isEmpty, placeholder: placeHolderView)
    }
}

private extension PrimaryTextField {
    func placeHolderView() -> some View {
        Text(placeholder)
            .font(.small(.regular))
            .foregroundColor(.textQuaternary)
    }
}

private extension PrimaryTextField {
    var isActive: Bool { !text.isEmpty }
    var iconColor: Color { isActive ? .textBrand : .textQuaternary }
}

// MARK: Placeholder
fileprivate extension View {
    func placeholder<Content: View>(when shouldShow: Bool,
                                    alignment: Alignment = .leading,
                                    @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

#Preview {
    PrimaryTextField(title: "Dupa", placeholder: "Ty dupa")
}
