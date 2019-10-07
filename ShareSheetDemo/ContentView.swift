//
//  ContentView.swift
//  ShareSheetDemo
//
//  Created by Jim Dovey on 10/7/19.
//  Copyright © 2019 Jim Dovey. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showShareSheet = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello World")
            Button(action: {
                self.showShareSheet = true
            }) {
                Text("Share Me").bold()
            }
        }
        .sheet(isPresented: $showShareSheet) {
            ShareSheet(activityItems: ["Hello World"])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
