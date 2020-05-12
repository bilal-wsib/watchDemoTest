//
//  listenView.swift
//  testMVP WatchKit Extension
//
//  Created by Bilal Malik on 2020-05-11.
//  Copyright © 2020 Bilal Malik. All rights reserved.
//
//  The Second screen, displayed after pressing start protecting in the first screen
//

import SwiftUI

struct listenView: View {
    @State var listShown: Bool//the two values input as parameters are stored in static variables
    @State var listCount: Int
    
    var body: some View {
        //contents placed inside the VStack are placed on top of another
        VStack{
            //if Listening is pressed, head to this screen, passing the parameters of the state of the tickets
            //to be used again  is returning to this screen from listenDecisionView
            NavigationLink(destination: listenDecisionView(total:listCount, oneOrMore:listShown)){
                Text("Listening").foregroundColor(Color.green)
            }
            Spacer()
            
            Button(action: {
                self.listShown=true
                self.listCount=self.listCount+1
            }) {
                Text("Ring If You're Hurt!").bold()
            }
            Spacer()
            
            if(listShown==true){
                NavigationLink(destination: listView(total: self.listCount)){
                    if(listCount==1){
                    Text("1 View Ring")
                    }
                    else{
                        Text("\(listCount) View Rings")
                    }

                }
            }
            
        }
    }
}

//trying to get the current time in button press
struct harm: View {
    
    var body: some View {
        Text("\(getDate())")
        
    }
}

func getDate()->String{
 let time = Date()
 let timeFormatter = DateFormatter()
 timeFormatter.dateFormat = "HH:ss"
 let stringDate = timeFormatter.string(from: time)
 return stringDate
}

struct listenView_Previews: PreviewProvider {
    static var previews: some View {
        listenView(listShown: false, listCount: 0)
    }
}
