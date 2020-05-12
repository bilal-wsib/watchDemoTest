import SwiftUI

struct listView: View {
    var ticketList = [watchData]()
    
    var body: some View {
        VStack {
            List(0 ..< ticketList.count) { result in
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
}
struct listView_Previews: PreviewProvider {
    static var previews: some View {
        listView(ticketList : [watchData]())
    }
}
