//
//  ContentView.swift
//  testMVP WatchKit Extension
//
//  Created by Bilal Malik on 2020-05-11.
//  Copyright © 2020 Bilal Malik. All rights reserved.
//
//  Home Page, seen when first running the app; where the start protecting button is displayed
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //passing in the necessary variables if Start Protecting is Pressed
        //Arguments include listShown and  which are the boolean to show or not show the
        //Hurt tickets and the number of tickets total on the next screen,
        //these are initialized to false and zero so no tickets will be seen
        NavigationLink(destination: listenView(listShown: false, listCount: 0)){
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
