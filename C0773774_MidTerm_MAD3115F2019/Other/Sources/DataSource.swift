//


import Foundation

/// This is the class to fetch data from json file
class DataSource {
    
    // MARK:- Life Cycle
    //
    private init(){ }
    
    // MARK:- Functions
    /** parsing method 1
     */
    static func readJsonWith(name file: String) -> [CustomersM] {
        let url = Bundle.main.url(forResource: file, withExtension: "json")
        guard let jsonData = url else{ return [] }
        guard let data = try? Data(contentsOf: jsonData) else { return [] }
        do {
            let decoder = JSONDecoder()
            let baseModel = try decoder.decode(BaseCustomers.self, from: data)
            guard let customers = baseModel.cust else { return [] }
            return customers
        } catch let err {
            debugPrint(err)
            return []
        }
    }
    
//    /// parsing method 2
//    static func readJsonFileWith(name file: String) -> [Employee] {
//        let url = Bundle.main.url(forResource: file, withExtension: "json")
//        guard let jsonData = url else{ return [] }
//        guard let dataParse = try? Data(contentsOf: jsonData) else { return [] }
//
//        do {
//            // check if json data can be converted to foundation object.
//            let json = try JSONSerialization.jsonObject(with: dataParse, options: .allowFragments)
//            var dataDict = NSDictionary()
//            dataDict = json as! NSDictionary
//            debugPrint(dataDict)
//
//            // get json data from foundation object
//            let jsonSer = try! JSONSerialization.data(withJSONObject: dataDict["Employee"] as! NSArray)
//
//            let decoder = JSONDecoder()
//            decoder.dateDecodingStrategy = .secondsSince1970
//
//            let employee = try decoder.decode([Employee].self, from: jsonSer)
//            debugPrint(employee)
//            return employee
//        } catch let err {
//            debugPrint(err)
//            return []
//        }
//    }
}
