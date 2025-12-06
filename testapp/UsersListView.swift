import SwiftUI

struct UsersListView: View {

    @EnvironmentObject var userManager: UserManager
    @State private var userToDelete: User?
    @State private var showDeleteAlert = false
    @State private var searchText = ""
    
    var filteredUsers: [User] {
        if searchText.isEmpty {
            return userManager.users
        } else {
            return userManager.users.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        List {
            ForEach(filteredUsers) { user in
                HStack {
                    VStack(alignment: .leading) {
                        Text("Name: \(user.name)")
                            .font(.headline)
                        Text("Age: \(user.age)")
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        userToDelete = user
                        showDeleteAlert = true
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                            .font(.title2)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                .padding(.vertical, 5)
            }
        }
        .navigationTitle("Users")
        .searchable(text: $searchText, prompt: "Search by name")
        .alert("Delete User", isPresented: $showDeleteAlert) {
            Button("Cancel", role: .cancel) {
                userToDelete = nil
            }
            Button("Delete", role: .destructive) {
                if let user = userToDelete {
                    userManager.deleteUser(user: user)
                }
                userToDelete = nil
            }
        } message: {
            if let user = userToDelete {
                Text("Are you sure you want to delete \(user.name)?")
            }
        }
    }
}
