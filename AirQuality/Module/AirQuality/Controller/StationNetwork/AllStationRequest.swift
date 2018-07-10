//
//  AllStationRequest.swift
//  AirQuality
//
//  Created by Arek Pituła on 09.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

class AllStationRequest: Request {
    
    var endPoint: String {
        return "findAll"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var urlParameters: Parameters?
    var bodyParameters: Parameters?
    var additionalHeader: HTTPHeader?
}
