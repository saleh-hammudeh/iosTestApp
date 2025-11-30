import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Welcome to the Squares Game")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("Choose the grid size you want")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                
                VStack(spacing: 20) {
                    NavigationLink("4 × 4") {
                        Hw2(rows: 4, cols: 4)
                    }
                    .buttonStyle(GridButtonStyle())
                    
                    NavigationLink("6 × 6") {
                        Hw2(rows: 6, cols: 6)
                    }
                    .buttonStyle(GridButtonStyle())
                    
                    NavigationLink("8 × 8") {
                        Hw2(rows: 8, cols: 8)
                    }
                    .buttonStyle(GridButtonStyle())
                    
                    NavigationLink("10 × 10") {
                        Hw2(rows: 10, cols: 10)
                    }
                    .buttonStyle(GridButtonStyle())
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
        }
    }
}

// ستايل بسيط للأزرار
struct GridButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 150, height: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

// Preview
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
