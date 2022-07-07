//
//  ViewController.swift
//  Mildy
//
//  Created by Дмитрий Скворцов on 04.07.2022.
//

import UIKit
import Combine
import MapKit
import CoreLocation

class ViewController: UIViewController {

    private let viewModel = TempViewModel()
    let weatherView = WeatherView()
    private var cancellable = Set<AnyCancellable>()

    private let map: MKMapView = {
        let map = MKMapView()
        return map
    }()

    override func loadView() {
        view = weatherView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherView.cityTextField.text = viewModel.city
        weatherView.cityTextField.delegate = self
        self.hideKeyboardWhenTappedAround()
        locate()
        binding()
    }

    private func binding() {
        weatherView.cityTextField.textPublisher.assign(to: \.city, on: viewModel).store(in: &cancellable)
        viewModel.$currentWeather.sink(receiveValue: { [weak self] currentWeather in self?.weatherView.tempLabel.text = currentWeather.main?.temp != nil ? "\(Int((currentWeather.main?.temp!)!)) ºC": " "}).store(in: &cancellable)
    }

    func locate() {
        LocationManager.shared.getUsersLocation(completion: {
            [weak self] location in
//            DispatchQueue.main.async {
//                guard let strongSelf = self else {
//                    return
//                }
//                strongSelf.addMapPin(with: location)
//            }

            LocationManager.shared.resolveLocationName(with: location) { [weak self] locationName in
                self?.weatherView.cityTextField.text = locationName
            }
        })
    }

//    func addMapPin(with location: CLLocation) {
//        let pin = MKPointAnnotation()
//        pin.coordinate = location.coordinate
//        map.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
//        map.addAnnotation(pin)
//    }
}



