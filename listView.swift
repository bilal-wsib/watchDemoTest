import SwiftUI

struct listView: View {
    @State var ticketList = [watchData]()
    
    var body: some View {
        VStack {
            List(0 ..< ticketList.count) { result in
                NavigationLink(destination: responseDecision(instance: self.ticketList, index: result)){
                    VStack{
                        Text(self.ticketList[result].currentTime)
                        Text(self.ticketList[result].address)
                    
                    if(self.ticketList[result].isResponded){
                        Text("Responded").foregroundColor(Color.green)
                    }
                    else{
                        Text("Haven't Responded").foregroundColor(Color.red)
                    }
                }
                }
            }
            NavigationLink(destination: listenView(listShown: true, listCount: ticketList.count)){
                Text("Dismiss")
            }
        }
    }
}

struct listView_Previews: PreviewProvider {
    static var previews: some View {
        listView(ticketList : [watchData]())
    }
}
