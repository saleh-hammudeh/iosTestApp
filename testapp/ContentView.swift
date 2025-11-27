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
                        .frame(width: 300, height: 200,alignment: .center)
                        .background(Color.gray)
                        .foregroundColor(Color.black)
                    
                    
                }
            }
            .padding()
            
        }
    }
}

#Preview {
    ContentView()
}
