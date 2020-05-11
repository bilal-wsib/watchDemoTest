//
//  ContentView.swift
//  testMVP WatchKit Extension
//
//  Created by Bilal Malik on 2020-05-11.
//  Copyright © 2020 Bilal Malik. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationLink(destination: listenView(list: false, count: 0)){
            HStack{
                Image(systemName: "Confirmation")
                Text("Start Protecting")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
