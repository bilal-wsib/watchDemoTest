//
//  listView.swift
//  testMVP WatchKit Extension
//
//  Created by Bilal Malik on 2020-05-11.
//  Copyright © 2020 Bilal Malik. All rights reserved.
//

import SwiftUI

struct listView: View {
    @State var ticketList = []

    var body: some View {
        
        VStack{
            List(0 ..< ticketList.count){ item in
            
            //NavigationLink(destinationName: responseDecision()){
                VStack{
                    Text("\(self.ticketList)")
                    Text("Rosewell and Fairway Street")
                    Text("Haven't Responded").foregroundColor(Color.red)

                }
            //}
        
        }
        
    }
}
}

struct listView_Previews: PreviewProvider {
    static var previews: some View {
        listView(ticketList: [])
    }
}
