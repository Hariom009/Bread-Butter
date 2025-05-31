//
//  Bread_ButterApp.swift
//  Bread&Butter
//
//  Created by Hari's Mac on 12.04.2025.
//

import SwiftUI
import SwiftData

@main
struct Bread_ButterApp: App {
    let container = try! ModelContainer(for: UserModel.self)
    let user  = UserLoader()
    let dataImporter: DataImporter
    init ()  {
        self.dataImporter = DataImporter(context: container.mainContext, user: user)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    do {
                        // i can do this or the init thing both works super well 
                        //let dataImporter = DataImporter(context: container.mainContext, user: user)
                        try await dataImporter.importData()
                    }catch{
                        print(error)
                    }
                }
        }.modelContainer(container)
    }
}
