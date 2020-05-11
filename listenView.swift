//
//  listenView.swift
//  testMVP WatchKit Extension
//
//  Created by Bilal Malik on 2020-05-11.
//  Copyright © 2020 Bilal Malik. All rights reserved.
//

import SwiftUI

struct listenView: View {
    @State var list: Bool
    @State var count: Int
    var body: some View {
        
        VStack{
            NavigationLink(destination: listenDecisionView(total:count, oneOrMore:list)){
                Text("Listening").foregroundColor(Color.green)
            }
            Spacer()
            
            Button(action: {
                self.list=true
                self.count=self.count+1
            }) {
                Text("Ring If You're Hurt!")
            }
            Spacer()
            
            if(list==true){
                NavigationLink(destination: listView(total: self.count)){
                    if(count==1){
                    Text("1 View Ring")
                    }
                    else{
                        Text("\(count) View Rings")
                    }

                }
            }
            
        }
    }
}

struct listenView_Previews: PreviewProvider {
    static var previews: some View {
        listenView(list: false, count: 0)
    }
}
