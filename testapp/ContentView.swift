//
//  ContentView.swift
//  testapp
//
//  Created by MBpro on 11/25/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, ios course!!!!")
                NavigationLink (
                    destination: Hw1()
                    
                ){
                    Text("Hw1")
                        .frame(width: UIScreen.main.bounds.width*0.8, height: 50,alignment: .center)
                        .background(Color.gray)
                }
                
                NavigationLink (
                    destination: WelcomeView()

                ){
                    Text("Hw2")
                        .frame(width: UIScreen.main.bounds.width*0.8, height: 50,alignment: .center)
                        .background(Color.gray)
                }
            }
            .padding()
            
        }
    }
}

#Preview {
    ContentView()
}
