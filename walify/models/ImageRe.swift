//
//  ImageRe.swift
//  walify
//
//  Created by rahat shovo  on 24/4/20.
//  Copyright © 2020 rahat shovo . All rights reserved.
//


import Foundation
import SwiftyJSON

struct ImageRe {
    
    var id : Int?
    var previewURL : String?
    var largeImageURL :  String?
    var webformatURL : String?
    


    


init()
{

}

init( json:JSON?)
{
    self.id = json?["id"].intValue
    self.previewURL = json?["previewURL"].stringValue
    self.largeImageURL = json?["largeImageURL"].stringValue
    self.webformatURL = json?["webformatURL"].stringValue
    

    
    
    
    
}
    
    
    
}
