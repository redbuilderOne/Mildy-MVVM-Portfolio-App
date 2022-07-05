//
//  ViewController.swift
//  Mildy
//
//  Created by Дмитрий Скворцов on 04.07.2022.
//

import UIKit
import Combine

class ViewController: UIViewController{

    private let viewModel = TempViewModel()
    let weatherView = WeatherView()

    override func loadView() {
        view = weatherView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        weatherView.cityTextField.text = viewModel.city
        binding()
    }

    func binding() {
        weatherView.cityTextField.textPublisher
           .assign(to: \.city, on: viewModel)
           .store(in: &cancellable)

        viewModel.$currentWeather
           .sink(receiveValue: {[weak self] currentWeather in

               self?.weatherView.tempLabel.text =
                currentWeather.main?.temp != nil ?
                "\(Int((currentWeather.main?.temp!)!)) ºC"
                : " "}
        )
           .store(in: &cancellable)
    }

     private var cancellable = Set<AnyCancellable>()
}

extension Date {
    var dayOfTheWeek: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }

    var hourAndDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE hh a"
        return dateFormatter.string(from: self)
    }

    var hourOfTheDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        return dateFormatter.string(from: self)
    }

    var timeOfTheDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
}

extension DateFormatter {
    static var shared: DateFormatter = {
        return DateFormatter()
    }()
}

