//
//  StationRouter.swift
//  AirQuality
//
//  Created by Arek Pituła on 09.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

class StationRouter: Router {
    override var api: API! {
        get {
            return AirAPI()
        }
        set {
            
        }
    }
    
    override var path: String {
        get {
            return "station/"
        }
        set {
            
        }
    }
}
