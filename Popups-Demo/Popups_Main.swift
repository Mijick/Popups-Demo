//
//  Popups_Main.swift 
//  Popups-Demo
//
//  Created by Alina Petrovska on 29.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//


import SwiftUI
import MijickPopups

@main struct Popups_Main: App {
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
                  .tapOutsideToDismissPopup(true)
            }
        }
    }}
}
