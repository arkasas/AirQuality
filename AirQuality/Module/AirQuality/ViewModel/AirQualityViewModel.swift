//
//  AirQualityViewModel.swift
//  AirQuality
//
//  Created by Arek Pituła on 09.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import UIKit

class AirQualityViewModel: NSObject {
    fileprivate let stationRouter = StationRouter()
    fileprivate let dataRouter = DataRouter()
    fileprivate let aqRouter = AqIndexRouter()
    
    fileprivate let sensorCollectionViewCellIdentifier = "sensorCollectionViewCell"
    private var airQuality = [AirQualityModel]()
    
    public func selectStation(_ station: Station) {
        UserDefaultController.station = station
    }

    public func reloadNavigationBar(_ navigationBar: UINavigationItem) {
        navigationBar.title = UserDefaultController.station?.stationName ?? ""
    }
    
    public func setupCollectionView(_ collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: "SensorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: sensorCollectionViewCellIdentifier)
        collectionView.dataSource = self
    }

    public func getSensors() {
        guard let station = UserDefaultController.station else { return }
        getStationSensor(id: station.id) { sensors in
            print(sensors)
        }
    }

    public func getAqIndex() {
        guard let station = UserDefaultController.station else { return }
        getAqIndex(id: station.id) { index in
            print(index)
        }
    }
}

extension AirQualityViewModel: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return cell(collectionView: collectionView, indexPath: IndexPath)
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
    
    func cellCount() -> Int {
        return airQuality.count
    }
    
    func cell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sensorCollectionViewCellIdentifier, for: IndexPath) as! SensorCollectionViewCell
        return cell
    }
}
