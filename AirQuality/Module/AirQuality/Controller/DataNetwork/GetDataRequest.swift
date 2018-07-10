//
//  GetDataRequest.swift
//  AirQuality
//
//  Created by Arkadiusz Pituła on 10.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

class GetDataRequest: Request {

    var endPoint: String = "getData/"

    var method: HTTPMethod {
        return .get
    }

    var urlParameters: Parameters?
    var bodyParameters: Parameters?
    var additionalHeader: HTTPHeader?

    init(id: Int) {
        endPoint += "\(id)"
    }
}
