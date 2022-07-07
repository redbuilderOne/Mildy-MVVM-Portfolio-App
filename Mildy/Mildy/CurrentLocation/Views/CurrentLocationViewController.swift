//
//  CurrentLocationViewController.swift
//  Mildy
//
//  Created by Дмитрий Скворцов on 07.07.2022.
//

import UIKit
import MapKit
import CoreLocation

class CurrentLocationViewController: UIViewController {

    private let map: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()

    private let cityLabel: UILabel = {
        let cityLabel = UILabel()
        cityLabel.textAlignment = .center
        cityLabel.backgroundColor = completeBlack
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.textColor = sandyStone
        cityLabel.font = .systemFont(ofSize: 28)
        return cityLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(map)
        view.addSubview(cityLabel)
        locate()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = almostGrey
        map.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        map.center = view.center
        setupConstraints()
    }

    private func locate() {
        LocationManager.shared.getUsersLocation({
            [weak self] location in
            DispatchQueue.main.async {
                guard let strongSelf = self else {
                    return
                }
                strongSelf.addMapPin(with: location)
            }

            LocationManager.shared.resolveLocationName(with: location) { [weak self] locationName in
                self?.cityLabel.text = locationName
            }
        })
    }

    private func addMapPin(with location: CLLocation) {
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        map.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
        map.addAnnotation(pin)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -170)
        ])
    }
}
