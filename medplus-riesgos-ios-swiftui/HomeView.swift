
import Foundation

import SwiftUI
import SwiftyJSON

struct HomeView: View {



    var body: some View {
        NavigationView {
            Text("HelloWorld")
        }
        
    }
    

    /*func getDataWebServices(bodyRequest: String) {
        WebServices.requestPostBasic(pathMethod: .URL_SELECT, data: bodyRequest, callbackSuccess: { response in
            print(response!)
        }, callbackFail: { fail in
                print(fail!)
            })
    }*/

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
