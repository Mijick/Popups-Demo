//
//  Bottom_ScrollablePopup.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 04.11.2024.
//

import SwiftUI
import MijickPopups

struct Bottom_ScrollablePopup: BottomPopup {
    var body: some View {
        ScrollView {
            createContent()
        }
        .frame(height: 400)
    }
    func configurePopup(config: BottomPopupConfig) -> BottomPopupConfig {
        config
            .cornerRadius(40)
            .enableDragGesture(false)
    }
}
private extension Bottom_ScrollablePopup {
    func createContent() -> some View {
        VStack(spacing: 0) {
            createBrandingContent()
            createTextField()
        }
        .padding(.horizontal, 40)
        .padding(.top, 40)
        .padding(.bottom, 8)
    }
}
private extension Bottom_ScrollablePopup {
    func createBrandingContent() -> some View {
        BrandingContent()
            .padding(.bottom, 44)
    }
    func createTextField() -> some View {
        Text(text)
            .multilineTextAlignment(.center)
            .font(.smallRegular)
            .foregroundStyle(Color.textSecondary)
            .padding(.bottom, 20)
    }
}
private extension Bottom_ScrollablePopup {
    var text: String { "Consectetur voluptate sint ea ullamco eu ex. Nulla duis fugiat magna. Minim proident labore adipisicing voluptate esse laborum tempor nulla laboris duis magna ea ea anim laborum. Esse do dolore irure tempor et commodo sunt irure. Cupidatat est aliquip aliqua in magna in deserunt officia aute Lorem fugiat cillum do id officia. Anim aliquip esse eu laborum consectetur culpa proident dolore nisi commodo. Duis in incididunt ex id excepteur nostrud. Consectetur voluptate sint ea ullamco eu ex. Nulla duis fugiat magna. Minim proident labore adipisicing voluptate esse laborum tempor nulla laboris duis magna ea ea anim laborum. Esse do dolore irure tempor et commodo sunt irure. Cupidatat est aliquip aliqua in magna in deserunt officia aute Lorem fugiat cillum do id officia. Anim aliquip esse eu laborum consectetur culpa proident dolore nisi commodo. Duis in incididunt ex id excepteur nostrud. Consectetur voluptate sint ea ullamco eu ex. Nulla duis fugiat magna. Minim proident labore adipisicing voluptate esse laborum tempor nulla laboris duis magna ea ea anim laborum. Esse do dolore irure tempor et commodo sunt irure. Cupidatat est aliquip aliqua in magna in deserunt officia aute Lorem fugiat cillum do id officia. Anim aliquip esse eu laborum consectetur culpa proident dolore nisi commodo. Duis in incididunt ex id excepteur nostrud." }
}
