//
//  AirQualityViewController.swift
//  AirQuality
//
//  Created by Arek Pituła on 09.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import UIKit
import Charts

protocol AirQualityViewControllerDelegate: class {
    func didSelect(newStation station: Station)
}

class AirQualityViewController: UIViewController {

    fileprivate let viewModel = AirQualityViewModel()
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var lineChartView: LineChartView!
    @IBOutlet private weak var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
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

extension AirQualityViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = viewModel.getAqModel(by: indexPath)
        viewModel.getData(by: model.code)
    }
}

extension AirQualityViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.height * 0.8, height: collectionView.frame.size.height * 0.8)
    }

}

extension AirQualityViewController: AirQualityViewModelDelegate {
    func reloadDescription(name: String, code: String) {
        DispatchQueue.main.async {
            self.dataLabel.text = "\(name.capitalizingFirstLetter()) (\(code))"
        }
    }
}

private extension AirQualityViewController {

    func setup() {
        viewModel.delegate = self
        collectionView.delegate = self
        setupChartView()
        setupCollectionView()
    }

    func setupChartView() {
        lineChartView.rightAxis.enabled = false
        lineChartView.chartDescription?.text = nil
        lineChartView.legend.enabled = false
        lineChartView.isUserInteractionEnabled = false
        lineChartView.xAxis.drawGridLinesEnabled = false
        lineChartView.animate(xAxisDuration: 0.6)
        lineChartView.xAxis.valueFormatter = ChartXAxisFormatter()
        lineChartView.noDataText = "Pobieranie..."
        viewModel.setupChartView(lineChartView)
    }
    
    func setupCollectionView() {
        collectionView.register(UINib(nibName: "SensorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: viewModel.sensorCollectionViewCellIdentifier)
        viewModel.setupCollectionView(collectionView)
    }
    
    func reloadData() {
        viewModel.reloadNavigationBar(navigationItem)
        viewModel.getAqIndex()
    }
}
