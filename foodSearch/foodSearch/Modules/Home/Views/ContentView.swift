//
//  ContentView.swift
//  foodSearch
//
//  Created by Santosh Karnati on 26/08/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .padding(.all, 20)
            .navigationTitle("Foods")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
