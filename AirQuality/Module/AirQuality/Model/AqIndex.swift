//
//  Aqindex.swift
//  AirQuality
//
//  Created by Arkadiusz Pituła on 09.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

enum AqType {
    case so2
    case no2
    case pm10
    case pm25
    case c6h6
    case o3

    static let allValues = [so2, no2, pm10, pm25, c6h6, o3]
}

struct AqIndex: Codable {
    var id: Int

    var stCalcDate: DateType
    var stIndexLevel: IndexLevel?
    var stSourceDataDate: String?

    //Dwutlenek siarki
    var so2CalcDate: DateType
    var so2IndexLevel: IndexLevel?
    var so2SourceDataDate: String?

    //Dwutlenek azotu
    var no2CalcDate: DateType
    var no2IndexLevel: IndexLevel?
    var no2SourceDataDate: String?

    //Tlenek węgla
    var coCalcDate: DateType
    var coIndexLevel: IndexLevel?
    var coSourceDataDate: String?

    //Pył zawieszony 10
    var pm10CalcDate: DateType
    var pm10IndexLevel: IndexLevel?
    var pm10SourceDataDate: String?

    //Pył zawieszony 25
    var pm25CalcDate: DateType
    var pm25IndexLevel: IndexLevel?
    var pm25SourceDataDate: String?

    //Ozon
    var o3CalcDate: DateType
    var o3IndexLevel: IndexLevel?
    var o3SourceDataDate: String?

    //Benzen
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
    case null()

    init(from decoder: Decoder) throws {
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }

        if let number = try? decoder.singleValueContainer().decode(Int.self) {
            self = .number(number)
            return
        }

        if let val = try? decoder.singleValueContainer().decodeNil() {
            self = .null()
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
