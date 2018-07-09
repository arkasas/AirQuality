//
//  Station.swift
//  AirQuality
//
//  Created by Arkadiusz Pituła on 09.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

struct Station: Codable {
    var id: Int
    var stationName: String
    var gegrLat: String
    var gegrLon: String
    var city: City
    var addressStreet: String?
}
