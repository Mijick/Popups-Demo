//
//  ContentView.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false, content: createContent).preferredColorScheme(.light)
    }
}

private extension ContentView {
    func createContent() -> some View {
        VStack(spacing: 10) {
           
        }
        .padding(.top, 40)
        .padding(.bottom, 32)
        .padding(.horizontal, 28)
    }
}
