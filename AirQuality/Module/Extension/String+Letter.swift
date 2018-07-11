//
//  String+Letter.swift
//  AirQuality
//
//  Created by Arek Pituła on 11.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
