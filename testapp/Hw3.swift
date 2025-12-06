import SwiftUI

struct Hw3: View {

    @EnvironmentObject var userManager: UserManager
    
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var showAlert = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 25) {
            
            // العنوان الرئيسي
            Text("Add User")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Text("Please enter user information")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 10)
            
            Spacer()
            
            // حقل الاسم
            VStack(alignment: .leading, spacing: 8) {
                Text("Name")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                TextField("Enter name", text: $name)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                    )
            }
            .padding(.horizontal)
            
            // حقل العمر
            VStack(alignment: .leading, spacing: 8) {
                Text("Age")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                TextField("Enter age", text: $age)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                    )
            }
            .padding(.horizontal)
            
            Spacer()
            
            // زر الحفظ
            Button("Save User") {
                userManager.addUser(name: name, age: age)
                name = ""
                age = ""
                showAlert = true
            }
            .alert("Done", isPresented: $showAlert) {
                Button("OK") {
                    presentationMode.wrappedValue.dismiss()
                }
            } message: {
                Text("User added successfully")
            }
            .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
            .padding()
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .foregroundColor(.white)
            .cornerRadius(12)
            .shadow(color: .blue.opacity(0.3), radius: 5, x: 0, y: 3)
            
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}
