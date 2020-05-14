//
//  responseDecision.swift
//  testMVP WatchKit Extension
//
//  Created by Bilal Malik on 2020-05-11.
//  Copyright © 2020 Bilal Malik. All rights reserved.
//

import SwiftUI

struct responseDecision: View {
    @State var instance = [watchData]()
    var index = Int()
    @State var lock : Int = 0
    var body: some View {
        ScrollView{
        
        VStack{
            
                Button(action: {
                    self.instance[self.index].isResponded=true
                    self.lock=1
                }) {
                    HStack{
                    
                         VStack {
                            Text("\(self.instance[self.index].address)")
                            Text("Send Help!")
                         }
                         if(lock==1){
                            Image(systemName: "checkmark.shield.fill")
                         }
                     }
                }
            
            
            Button(action: {
                self.instance[self.index].isResponded=true
                self.lock=2
            }) {
                HStack{
               
                    VStack {
                        Text("I'm OK!")
                    }
                    if(lock==2){
                        Image(systemName: "checkmark.shield.fill")
                    }
                }
            }
            
            Button(action: {
                self.instance[self.index].isResponded=true
                self.lock=3
            }) {
                HStack{
               
                    VStack {
                        Text("False Alarm")
                    }
                    if(lock==3){
                        Image(systemName: "checkmark.shield.fill")
                    }
                }
            }
            
            NavigationLink(destination: listView(ticketList: self.instance)){
                Image(systemName: "paperplane.fill")
            }
        }
        }
    }
}


struct responseDecision_Previews: PreviewProvider {
    static var previews: some View {
        responseDecision(instance: [watchData](),index: Int())
    }
}

