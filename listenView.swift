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
    
    @State var listOfData=[watchData]()
    
    
    var body: some View {
        //contents placed inside the VStack are placed on top of another
        VStack{
            //if Listening is pressed, head to this screen, passing the parameters of the state of the tickets
            //to be used again  is returning to this screen from listenDecisionView
            NavigationLink(destination: listenDecisionView(total:listCount, oneOrMore:listShown)){
                Text("Listening")
            }
            Spacer()
            
            Button(action: {
                self.listShown=true
                self.listCount=self.listCount+1
                
                let watchDataTicket = watchData.init()
                self.listOfData.append(watchDataTicket)
                print(self.listOfData[0].currentTime)
            }) {
                Text("Ring If You're Hurt!").bold()
            }
            Spacer()
            
            if(listShown==true){
                NavigationLink(destination: listView(ticketList: self.listOfData)){
                    if(listCount==1){
                        HStack{
                            Image(systemName: "1.circle")
                            Text("View Ring")
                        }
                    }
                    else{
                        HStack{
                            Image(systemName: "\(listCount).circle")
                            Text("View Rings")
                        }
                    }

                }
            }
            
        }
    }
}


class watchData{
    var address: String// = "123 King St." //getLocation()
    var currentTime: String //= getDate()
    var isResponded: Bool //= false
    
    init() {
        self.address = "123 King St."
        self.currentTime = getDate()
        self.isResponded = false
    }
}

func getDate()->String{
    let time = Date()
    let timeFormatter = DateFormatter()
    timeFormatter.dateFormat = "HH:mm:ss"
    let stringDate = timeFormatter.string(from: time)
    return stringDate
}

struct listenView_Previews: PreviewProvider {
    static var previews: some View {
        listenView(listShown: false, listCount: 0)
    }
}
