//
//  DexApp.swift
//  Dex
//
//  Created by Ana Clara Moreira Rodrigues on 12/06/25.
//

import SwiftUI

@main
struct DexApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
