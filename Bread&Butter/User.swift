//
//  User.swift
//  Bread&Butter
//
//  Created by Hari's Mac on 15.04.2025.
//

import Foundation

struct Friend: Codable, Identifiable{
    let id : UUID
    let name: String
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
struct User: Codable, Identifiable{
    let id : UUID
    let isActive : Bool
    let name : String
    let age :   Int
    let company: String
    let email : String
    let friends: [Friend]
    let address: String
    let about : String
//    let registered: Date
    init(id: UUID, isActive: Bool, name: String, age: Int, company: String, email: String, friends: [Friend], address: String, about: String) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.friends = friends
        self.address = address
        self.about = about
        //self.registered = registered
    }
}


struct UserLoader{
    func fetchData() async throws -> [User] {
           guard let url = URL(string : "https://www.hackingwithswift.com/samples/friendface.json") else {
               print("Invalid URL")
               return []
           }
           let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            return []
        }
            let userdata = try JSONDecoder().decode([User].self, from: data)
            return userdata
       // return []
    }
}
