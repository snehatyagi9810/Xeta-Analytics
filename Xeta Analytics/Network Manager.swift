//
//  Network Manager.swift
//  Xeta Analytics
//
//  Created by Sneh on 21/11/23.
//

import Foundation

class NetworkManager {
    
    func fetchData(comp:@escaping (_ model: HomeModel) -> Void) {
        let url = URL(string: "http://52.25.229.242:8000/homepage_v2/")
        URLSession.shared.dataTask(with: url!) {data,response,error in
            if let error {
                print( error.localizedDescription)
                return
            }
                if let data {
                    data.printJSON()
                 let decoder = JSONDecoder()
                    do {
                        let data = try decoder.decode(HomeModel.self, from: data)
                        comp(data)
                        print (data)
                    } catch{
                        print(error)
                    }
                    
                }
        } .resume()
        
        print("function end")
    }
}

extension Data{
    func printJSON(){
        if let JSONString = String(data: self, encoding: String.Encoding.utf8){
            print(JSONString)
        }
    }
}
