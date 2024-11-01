//
//  PopupView_Main.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickPopups

@main struct PopupView_Main: App {
    var body: some Scene { WindowGroup {
        ContentView().registerPopups()
        { container in
            container.centre {
                $0.backgroundColor(.backgroundSecondary)
                  .cornerRadius(20)
                  .popupHorizontalPadding(20)
            }
            .vertical {
                $0.backgroundColor(.backgroundSecondary)
                  .cornerRadius(20)
                  .enableStacking(true)
            }
        }
    }}
}
