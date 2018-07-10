//
//  SensorData.swift
//  AirQuality
//
//  Created by Arkadiusz Pituła on 10.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

struct SensorData: Codable {
    var key: String
    var values: [SensorDataValue]
}

struct SensorDataValue: Codable {
    var date: String
    var value: Double?
}
