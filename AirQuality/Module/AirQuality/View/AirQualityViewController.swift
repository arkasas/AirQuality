//
//  AirQualityViewController.swift
//  AirQuality
//
//  Created by Arek Pituła on 09.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import UIKit

protocol AirQualityViewControllerDelegate: class {
    func didSelect(newStation station: Station)
}

class AirQualityViewController: UIViewController {

    fileprivate let viewModel = AirQualityViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction private func editButtonClick() {
        let vc = UIStoryboard(name: "Stations", bundle: nil).instantiateInitialViewController() as! UINavigationController
        (vc.viewControllers[0] as! StationsViewController).airDelegate = self
        show(vc, sender: self)
    }

}

extension AirQualityViewController: AirQualityViewControllerDelegate {
    func didSelect(newStation station: Station) {
        viewModel.selectStation(station)
        reloadData()
    }
}

private extension AirQualityViewController {
    func reloadData() {
        viewModel.reloadNavigationBar(navigationItem)
        viewModel.getSensors()
        viewModel.getAqIndex()
    }
}
