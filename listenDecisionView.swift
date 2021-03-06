//
//  listenDecisionView.swift
//  testMVP WatchKit Extension
//
//  Created by Bilal Malik on 2020-05-11.
//  Copyright © 2020 Bilal Malik. All rights reserved.
//

import SwiftUI

struct listenDecisionView: View {
    @State var total: Int
    @State var oneOrMore: Bool
    var body: some View {
        VStack{
            NavigationLink(destination: ContentView()){
                HStack{
                    Image(systemName: "wifi.slash")
                    Text("Stop Listening")
                }
            }
            NavigationLink(destination: listenView(listShown: oneOrMore, listCount: total)){
                HStack{
                    Image(systemName: "wifi")
                    Text("Keep Listening")
                }
            }
        }
    }
}

struct listenDecisionView_Previews: PreviewProvider {
    static var previews: some View {
        listenDecisionView(total: 0, oneOrMore: false)
    }
}
