//
//  Aqindex.swift
//  AirQuality
//
//  Created by Arkadiusz Pituła on 09.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

struct AqIndex: Codable {
    var id: Int

    var stCalcDate: DateType
    var stIndexLevel: IndexLevel?
    var stSourceDataDate: String?

    var so2CalcDate: DateType
    var so2IndexLevel: IndexLevel?
    var so2SourceDataDate: String?

    var no2CalcDate: DateType
    var no2IndexLevel: IndexLevel?
    var no2SourceDataDate: String?

    var coCalcDate: DateType
    var coIndexLevel: IndexLevel?
    var coSourceDataDate: String?

    var pm10CalcDate: DateType
    var pm10IndexLevel: IndexLevel?
    var pm10SourceDataDate: String?

    var pm25CalcDate: DateType
    var pm25IndexLevel: IndexLevel?
    var pm25SourceDataDate: String?

    var o3CalcDate: DateType
    var o3IndexLevel: IndexLevel?
    var o3SourceDataDate: String?

    var c6h6CalcDate: DateType
    var c6h6IndexLevel: IndexLevel?
    var c6h6SourceDataDate: String?

    var stIndexStatus: Bool
    var stIndexCrParam: String
}

struct IndexLevel: Codable {
    var id: Int
    var indexLevelName: String
}

enum DateType: Codable {
    case string(String)
    case number(Int)

    init(from decoder: Decoder) throws {
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }

        if let number = try? decoder.singleValueContainer().decode(Int.self) {
            self = .number(number)
            return
        }

        throw DateTypeError.missingValue
    }

    func encode(to encoder: Encoder) throws {

    }

    enum DateTypeError: Error {
        case missingValue
    }
}
