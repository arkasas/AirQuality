//
//  Aqindex.swift
//  AirQuality
//
//  Created by Arkadiusz Pituła on 09.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

struct AqIndex: Codable {
    var id: Int

    var stCalcDate: String
    var stIndexLevel: IndexLevel?
    var stSourceDataDate: String

    var so2CalcDate: String
    var so2IndexLevel: IndexLevel?
    var so2SourceDataDate: String

    var no2CalcDate: String
    var no2IndexLevel: IndexLevel?
    var no2SourceDataDate: String

    var coCalcDate: String
    var coIndexLevel: IndexLevel?
    var coSourceDataDate: String

    var pm10CalcDate: String
    var pm10IndexLevel: IndexLevel?
    var pm10SourceDataDate: String

    var pm25CalcDate: String
    var pm25IndexLevel: IndexLevel?
    var pm25SourceDataDate: String

    var o3CalcDate: String
    var o3IndexLevel: IndexLevel?
    var o3SourceDataDate: String

    var c6h6CalcDate: String
    var c6h6IndexLevel: IndexLevel?
    var c6h6SourceDataDate: String
}

struct IndexLevel: Codable {
    var id: Int
    var indexLevelName: String
}
