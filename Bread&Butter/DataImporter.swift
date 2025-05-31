//
//  DataImporter.swift
//  Bread&Butter
//
//  Created by Hari's Mac on 15.04.2025.
//

import Foundation
import SwiftData

struct DataImporter{
    let context: ModelContext
    let user: UserLoader
    
    @MainActor
    func importData() async throws{
        // let context = container.mainContext
        
        var userDescriptor = FetchDescriptor<UserModel>()
        userDescriptor.fetchLimit = 1
        let persisitedUser = try context.fetch(userDescriptor)
        if persisitedUser.isEmpty{
            let users =  try await user.fetchData()
            if !users.isEmpty{
                // Inset users in ondevice database
                users.forEach { user in
                    let newUser = UserModel(name: user.name, age: user.age, company: user.company, email: user.email, friends: user.friends)
                    context.insert(newUser)
                    
                }
            }
        }
    }
}
