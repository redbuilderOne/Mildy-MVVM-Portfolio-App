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
    let currentLocationView = CurrentLocationView()

    private let map: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()

    override func loadView() {
        view = currentLocationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(map)
        title = ""
        locate()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = frontblue
        map.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        map.center = view.center
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
                self?.currentLocationView.cityLabel.text = locationName
            }
        })
    }

    private func addMapPin(with location: CLLocation) {
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        map.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
        map.addAnnotation(pin)
    }
}
