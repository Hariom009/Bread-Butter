import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @Query var users:[UserModel]

    var body: some View {
        List{
            Text("User count : \(users.count)")
            ForEach(users){ user in
                Text(user.name)
            }
        }
     }
//    func printfriends(for user: User) -> some View {
//        VStack(alignment: .leading) {
//            Text("Friends:")
//                .font(.headline)
//            
//            ForEach(user.friends) { friend in
//                Text("- \(friend.name)")
//            }
//        }
//    }
    
//    // Fetch and decode the user data
    
}

#Preview {
    ContentView()
}

