//
//  Sensor.swift
//  AirQuality
//
//  Created by Arkadiusz Pituła on 09.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

struct Sensor: Codable {
    var id: Int
    var stationId: Int
}

struct SensorParam: Codable {

    enum CodingKeys: String, CodingKey {
        case name = "paramName"
        case formula = "paramFormula"
        case code = "paramCode"
        case id = "idParam"
    }
    
    var name: String
    var formula: String
    var code: String
    var id: Int
}
