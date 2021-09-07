//
//  foodSearchApp.swift
//  foodSearch
//
//  Created by Santosh Karnati on 26/08/21.
//

import SwiftUI

@main
struct foodSearchApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
