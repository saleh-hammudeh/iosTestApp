import SwiftUI

struct AddOrShowUsers: View {
    @EnvironmentObject var userManager: UserManager

    var body: some View {
        VStack(spacing: 30) {
            Text("Welcome to Add Delete Show Users")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            // عداد المستخدمين
            HStack {
                Image(systemName: "person.3.fill")
                    .font(.title2)
                    .foregroundColor(.blue)
                
                Text("Total Users: \(userManager.users.count)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.blue.opacity(0.1))
                    .shadow(color: .blue.opacity(0.2), radius: 5, x: 0, y: 2)
            )
            
            VStack(spacing: 20) {
                NavigationLink("Add New User") {
                    Hw3()
                        .environmentObject(userManager)
                }
                .buttonStyle(GridButtonStyle1())
                
                NavigationLink("Show Users") {
                    UsersListView()
                        .environmentObject(userManager)
                }
                .buttonStyle(GridButtonStyle1())
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
    }
}

struct GridButtonStyle1: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 150, height: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
