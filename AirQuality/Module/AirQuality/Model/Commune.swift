//
//  Commune.swift
//  AirQuality
//
//  Created by Arkadiusz Pituła on 09.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

struct Commune: Codable {

    enum CodingKeys: String, CodingKey {
        case name = "communeName"
        case district = "districtName"
        case privince = "provinceName"
    }

    var name: String
    var district: String
    var privince: String
}
