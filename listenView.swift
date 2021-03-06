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

var listOfObjs = [watchData]()

struct listenView: View {
    @State var listShown: Bool//the two values input as parameters are stored in static variables
    @State var listCount: Int
    
    @State var listOfData=[watchData]()
    
    
    var body: some View {
        ScrollView{
        //contents placed inside the VStack are placed on top of another
        VStack{
            //if Listening is pressed, head to this screen, passing the parameters of the state of the tickets
            //to be used again  is returning to this screen from listenDecisionView
            NavigationLink(destination: listenDecisionView(total:listCount, oneOrMore:listShown)){
                Text("Listening")
            }
            Spacer()
            
            Button(action: {
                getAddress()
                self.listShown=true
                self.listCount=self.listCount+1

            }) {
                Text("Ring If You're Hurt!").bold()
            }
            Spacer()
            
            if(listShown==false){
                Text("Manual").bold()
                Text("If your apple Watch misses a detection").foregroundColor(Color.gray)
            }
            
            
            if(listShown==true){
                NavigationLink(destination: listView(ticketList: listOfObjs)){
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

}


class watchData{
    var address: String// = "123 King St." //getLocation()
    var currentTime: String //= getDate()
    var isResponded: Bool //= false
    
    init(address:String, date: String) {
        self.address = address
        self.currentTime = date
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

func getAddress() {
    var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
    let lat: Double = 43.4643
    let lon: Double = -80.5204
    let ceo: CLGeocoder = CLGeocoder()
    center.latitude = lat
    center.longitude = lon
    var addressString : String = ""

    let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
    //print(loc)

    ceo.reverseGeocodeLocation(loc, completionHandler:
        {(placemarks, error) in
            if (error != nil)
            {
                print("reverse geodcode fail: \(error!.localizedDescription)")
            }
            let pm = placemarks! as [CLPlacemark]

            if pm.count > 0 {
                let pm = placemarks![0]
                
                addressString = pm.subLocality! + ", "
                addressString += pm.thoroughfare! + ", "
                addressString += pm.locality! + ", "
                addressString += pm.postalCode!
          }
            
            test(test: addressString)
    })
}
func test(test: String) {
    let watchDataTicket = watchData.init(address:test, date: getDate())
    listOfObjs.append(watchDataTicket)
}
