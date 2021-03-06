//
//  SensorCollectionViewCell.swift
//  AirQuality
//
//  Created by Arek Pituła on 10.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import UIKit

class SensorCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var codeLabel: UILabel!
    @IBOutlet private weak var indexLevelNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configure(with model: AirQualityModel) {
        nameLabel.text = model.name
        codeLabel.text = model.code
        indexLevelNameLabel.text = model.indexLevel?.indexLevelName
    }

}
