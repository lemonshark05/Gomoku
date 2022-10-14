//
//  ContentView.swift
//  Gomoku
//
//  Created by lemonshark on 2022/10/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("Detail View")
            } label: {
                Text("Hello World")
                    .padding()
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
