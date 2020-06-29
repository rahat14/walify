//
//  responseModels.swift
//  walify
//
//  Created by rahat shovo  on 24/4/20.
//  Copyright © 2020 rahat shovo . All rights reserved.
//

import Foundation
import SwiftyJSON

struct responseModels {
    
    
    var hits: ImageReponse?

    
    init()
    {
        
    }
    init(json: JSON?) {
        
 
        if let value = json?["hits"].arrayValue
        {
            let  new = ImageReponse(json: JSON(value))
            self.hits = new 
        }
        
    }
}

