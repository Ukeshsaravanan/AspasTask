//
//  AspasTaskApp.swift
//  AspasTask
//
//  Created by UKESH KUMAR on 17/05/23.
//

import SwiftUI

@main
struct AspasTaskApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
