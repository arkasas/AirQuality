//
//  AirQualityViewModel.swift
//  AirQuality
//
//  Created by Arek Pituła on 09.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import UIKit
import Charts

class AirQualityViewModel: NSObject {
    fileprivate let stationRouter = StationRouter()
    fileprivate let dataRouter = DataRouter()
    fileprivate let aqRouter = AqIndexRouter()
    
    fileprivate let sensorCollectionViewCellIdentifier = "sensorCollectionViewCell"
    fileprivate var collectionView: UICollectionView!
    fileprivate var chartView: LineChartView!
    fileprivate let emptyView: EmptyView = .fromNib()

    private var airQuality = [AirQualityModel]()


    public func selectStation(_ station: Station) {
        UserDefaultController.station = station
    }


    public func reloadNavigationBar(_ navigationBar: UINavigationItem) {
        if let name = UserDefaultController.station?.stationName {
            removeEmptyView()
            navigationBar.title = name
        } else {
            addEmptyView()
        }
    }
    
    public func setupCollectionView(_ collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: "SensorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: sensorCollectionViewCellIdentifier)
        collectionView.dataSource = self

        self.collectionView = collectionView
    }

    public func setupChartView(_ chartView: LineChartView) {
        let llXAxis = ChartLimitLine(limit: 10, label: "Index 10")
        llXAxis.lineWidth = 4
        llXAxis.lineDashLengths = [10, 10, 0]
        llXAxis.labelPosition = .rightBottom
        llXAxis.valueFont = .systemFont(ofSize: 10)

        chartView.xAxis.gridLineDashLengths = [10, 10]
        chartView.xAxis.gridLineDashPhase = 0

        chartView.rightAxis.enabled = false

        self.chartView = chartView
    }

    public func getSensors() {
        guard let station = UserDefaultController.station else { return }
        getStationSensor(id: station.id) { [weak self] sensors in
            guard let `self` = self else { return }
        }
    }

    public func getAqIndex() {
        guard let station = UserDefaultController.station else { return }
        getAqIndex(id: station.id) { [weak self] index in
            guard let `self` = self else { return }
            guard let index = index else { return }

            self.airQuality = AqModelFactory().generateAllValidModel(model: index)
            self.reloadSensorCollectionView()
        }
    }

    public func getData(by code: String) {
        guard let station = UserDefaultController.station else { return }
        getStationSensor(id: station.id) { [weak self] sensors in
            guard let `self` = self else { return }

            if let sensor = sensors.filter({ $0.param.code == code}).first {
                self.getData(by: sensor.id)
            }
        }

    }

    public func getData(by id: Int) {
        getData(id: id) { [weak self]  sensorData in
            guard let `self` = self else { return }

            let data = self.generatCharData(sensorData: sensorData)

            DispatchQueue.main.async {
                self.chartView.data = data
            }
        }

    }

    public func getAqModel(by indexPath: IndexPath) -> AirQualityModel {
        return airQuality[indexPath.row]
    }

}

extension AirQualityViewModel: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return cell(collectionView: collectionView, indexPath: indexPath)
    }
}

private extension AirQualityViewModel {

    func getStationSensor(id: Int, completion: @escaping (_ result: [Sensor]) -> Void) {
        let request = StationSensorRequest(id: id)
        stationRouter.execute(request: request) { (result: Response<[Sensor]>) in
            completion(result.value ?? [])
        }
    }

    func getData(id: Int, completion: @escaping (_ result: SensorData) -> Void) {
        let request = GetDataRequest(id: id)
        dataRouter.execute(request: request) { (result: Response<SensorData>) in
            completion(result.value ?? SensorData(key: "", values: []))
        }
    }

    func getAqIndex(id: Int, completion: @escaping (_ result: AqIndex?) -> Void) {
        let request = AqGetDataRequest(id: id)
        aqRouter.execute(request: request) { (result: Response<AqIndex>) in
            completion(result.value)
        }
    }
    
    func cell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sensorCollectionViewCellIdentifier, for: indexPath) as! SensorCollectionViewCell
        cell.configure(with: airQuality[indexPath.row])
        return cell
    }

    func cellCount() -> Int {
        return airQuality.count
    }

    func reloadSensorCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    func generatCharData(sensorData: SensorData) -> LineChartData {
        let values = generateCharEntry(sensorData: sensorData)
        let set = LineChartDataSet(values: values, label: nil)
        set.setColor(.red)
        set.lineWidth = 1
        set.circleRadius = 0
        set.formLineWidth = 1
        set.formSize = 15
        
        return LineChartData(dataSet: set)
    }

    func generateCharEntry(sensorData: SensorData) -> [ChartDataEntry] {
        let allValues = sensorData.values.filter { $0.value != nil }
        let values = (0..<allValues.count).map { (i) -> ChartDataEntry in
            return ChartDataEntry(x: Double(i), y: allValues[i].value!)
        }

        return values

    }

    func addEmptyView() {
        emptyView.frame = collectionView.superview!.frame
        collectionView.superview!.addSubview(emptyView)
    }

    func removeEmptyView() {
        emptyView.removeFromSuperview()
    }

}
