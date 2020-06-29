//
//  ImageResponse.swift
//  walify
//
//  Created by rahat shovo  on 24/4/20.
//  Copyright © 2020 rahat shovo . All rights reserved.
//

import Foundation
import SwiftyJSON

struct ImageReponse {
    
    var ida = [Int?]()
    var previewURLa =  [String]()
    var largeImageURLa =  [String]()


    


init()
{

}

init( json:JSON)
{
//    self.id = json?["id"].int16Value
//    self.previewURL = json?["previewURL"].stringValue
//    self.largeImageURL = json?["largeImageURL"].stringValue
    
    
    for i in json.arrayValue{
               
               var id: Int = 0
               var previewURL: String = ""
               var largeImageURL: String = ""
               
               id = i["id"].intValue
               previewURL = i["previewURL"].stringValue
               largeImageURL = i["largeImageURL"].stringValue
               
               ida.append(id)
               previewURLa.append(previewURL)
               largeImageURLa.append(largeImageURL)
               
           }
    
    
    
    
}
    
    
    
}
