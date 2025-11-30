import SwiftUI

struct Hw1: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var selectedOption = 1
    @State private var isNotificationEnabled = true
    @State private var isDarkEnabled = false
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(spacing: 25) {
                    HStack(spacing: 20) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 50))
                            .foregroundStyle(.tint)
                            
                        VStack(alignment: .leading, spacing: 4) {
                            Text(name.isEmpty ? "Name" : name)
                                .font(.headline)
                            Text(email.isEmpty ? "Email" : email)
                                .font(.subheadline)
                        }
                        Spacer()
                        
                    }
                    VStack(spacing: 12) {
                        HStack(spacing: 12) {
                            Text("Edit profile")
                                .font(.system(size: 20))
                                
                            Spacer()
                        }
                        TextField("Enter name", text: $name)
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(8)
                        
                        TextField("Enter email", text: $email)
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(8)
                            .keyboardType(.emailAddress)
                        
                    }
                    .padding(.horizontal, 5)
                    
                }
                .padding(20)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
                .padding()
                VStack(spacing: 25) {
                    HStack {
                        Text("Region")
                            .font(.title2)
                        Spacer()
                    }
                    Picker("Options", selection: $selectedOption) {
                        Text("Europ").tag(1)
                        Text("America").tag(2)
                        Text("Asia").tag(3)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding(10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
                .padding()
                VStack(spacing: 25) {
                    HStack {
                        Text("Preferences")
                            .font(.title2)
                        Spacer()
                    }
                    Toggle("Enable Notification", isOn: $isNotificationEnabled)
                    Toggle("Dark Mode", isOn: $isDarkEnabled)
                }
                .padding(10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
                .padding()
            }
            .navigationTitle("Account")
            .navigationBarTitleDisplayMode(.large)
            Button(action: {}) {
                Text("Save Change")
                    
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
        }
        
    }
}

#Preview {
    Hw1()
}
