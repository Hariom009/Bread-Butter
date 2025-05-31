import SwiftUI
import SwiftData

@Model
class UserModel {
  //  let isActive : Bool
    var name : String
    var age :   Int
    var company: String
    var email : String
    var friends: [Friend]

    
    init(name: String, age: Int, company: String, email: String, friends: [Friend]) {

        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.friends = friends
    }
}
