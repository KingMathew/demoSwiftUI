
import Foundation
import Alamofire
import SwiftyJSON

class WebServices {

    static var PROD: Bool = false

    static var session: Alamofire.SessionManager {
        get {
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = TimeInterval(240) //4 min
            let sessionManager = Alamofire.SessionManager(configuration: configuration)
            return sessionManager
        }
    }

    static func getHOST() -> String {
        return (self.PROD) ? "https://web.medplus.net.co/sucursal_api/" : "http://landing.medplus.com.co:8081/"
    }

    static func getHostTest() -> String {
        return "https://www.crn-ltda.com/services/"
    }
  
    public enum METHODS: String {
        case URL_SELECT = "select.php"
    }

    static func requestGetBasic(pathMethod: METHODS, callbackSuccess: @escaping (JSON?) -> (), callbackFail: @escaping (JSON?) -> ()) {
        let host = self.getHostTest() + pathMethod.rawValue
        Alamofire.request(host).validate().responseJSON { response in
            //print("Response in service \(response)")
            switch response.result {
            case .success:
                let responseJSON = JSON([
                    "data": response.result.value,
                    "statuscode": response.response!.statusCode
                    ])
                callbackSuccess(JSON(responseJSON))
            case .failure(let error):
                callbackFail(JSON(error))
            }
        }
    }
    
    static func requestPostBasic(pathMethod: METHODS, data: String, callbackSuccess: @escaping (JSON?) -> (), callbackFail: @escaping (JSON?) -> ()) {

        let host = self.getHostTest()
        let url = URL(string: host + pathMethod.rawValue)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = data.data(using: .utf8)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")

        Alamofire.request(urlRequest).responseJSON(completionHandler: {
            response in
            switch response.result {
            case .success:
                let responseJSON = JSON([
                    "data": response.result.value,
                    "statuscode": response.response!.statusCode
                    ])
                callbackSuccess(responseJSON)
            case .failure(let error):
                callbackFail(JSON(error))
            }
        })

    }


    

}
