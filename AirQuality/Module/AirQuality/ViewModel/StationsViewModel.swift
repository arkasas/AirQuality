//
//  StationsViewModel.swift
//  AirQuality
//
//  Created by Arkadiusz Pituła on 10.07.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import UIKit

class StationsViewModel: NSObject {

    fileprivate let stationRouter = StationRouter()
    fileprivate let cellIdentifier = "stationCell"

    fileprivate var stations = [StationCellModel]()
    fileprivate var tableView: UITableView!

    init(tableView: UITableView) {
        super.init()

        self.tableView = tableView
        self.tableView.dataSource = self
    }

    func getStations() {
        getAllStation { stations in
            self.stations = stations.compactMap {
                let model = StationCellModel(station: $0)
                return model
            }

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func station(by indexPath: IndexPath) -> StationCellModel {
        return stations[indexPath.row]
    }

    func markStation(for indexPath: IndexPath) {
        stations[indexPath.row].isSelected = true
    }

    func unmarkStation(for indexPath: IndexPath) {
        stations[indexPath.row].isSelected = false
    }

}

extension StationsViewModel: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell(tableView: tableView, indexPath: indexPath)
    }
}

private extension StationsViewModel {
    func getAllStation(completion: @escaping (_ result: [Station]) -> Void) {
        let request = AllStationRequest()
        stationRouter.execute(request: request) { (result: Response<[Station]>) in
            completion(result.value ?? [])
        }
    }

    func cellsCount() -> Int {
        return stations.count
    }

    func cell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = stations[indexPath.row].station.stationName
        cell.selectionStyle = .none
        cell.accessoryType = (stations[indexPath.row]).isSelected ? .checkmark : .none
        return cell
    }

}


