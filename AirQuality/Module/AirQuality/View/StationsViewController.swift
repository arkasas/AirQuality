//
//  StationsViewController.swift
//  AirQuality
//
//  Created by Arkadiusz Pituła on 10.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import UIKit

class StationsViewController: UIViewController {
    
    fileprivate var viewModel: StationsViewModel!
    fileprivate var selectedStation: Station! {
        didSet {
            doneButton.isEnabled = true
            doneButton.title = "Zmień"
        }
    }
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var doneButton: UIBarButtonItem!
    
    public weak var airDelegate: AirQualityViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        
        viewModel = StationsViewModel(tableView: tableView)
        viewModel.getStations()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction private func doneClick() {
        airDelegate?.didSelect(newStation: selectedStation)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func close() {
        dismiss(animated: true, completion: nil)
    }
}

extension StationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedStation = viewModel.station(by: indexPath).station
        viewModel.markStation(for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        viewModel.unmarkStation(for: indexPath)
    }
}

