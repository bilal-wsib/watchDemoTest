//
//  listView.swift
//  testMVP WatchKit Extension
//
//  Created by Bilal Malik on 2020-05-11.
//  Copyright © 2020 Bilal Malik. All rights reserved.
//

import SwiftUI

struct listView: View {
    @State var total: Int
    var body: some View {
        
        VStack{
        List(0 ..< total){ item in
            
            //NavigationLink(destinationName: responseDecision()){
                VStack{
                    Text("10:17 am")
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
        listView(total: 0)
    }
}
