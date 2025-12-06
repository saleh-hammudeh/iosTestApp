import SwiftUI
import Combine

class UserManager: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        // إضافة 5 مستخدمين ثابتين عند إنشاء UserManager
        loadInitialUsers()
    }
    
    private func loadInitialUsers() {
        users = [
            User(name: "Ahmed Ali", age: "25"),
            User(name: "Sara Mohammed", age: "22"),
            User(name: "Omar Hassan", age: "30"),
            User(name: "Layla Ibrahim", age: "28"),
            User(name: "Khaled Youssef", age: "35")
        ]
    }

    func addUser(name: String, age: String) {
        let newUser = User(name: name, age: age)
        users.append(newUser)
    }
    
    func deleteUser(user: User) {
        users.removeAll { $0.id == user.id }
    }
}
