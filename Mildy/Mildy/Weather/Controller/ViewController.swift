//
//  ViewController.swift
//  Mildy
//
//  Created by Дмитрий Скворцов on 04.07.2022.
//

import UIKit
import Combine

class ViewController: UIViewController {

    private let viewModel = TempViewModel()
    let weatherView = WeatherView()

    override func loadView() {
        view = weatherView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherView.cityTextField.text = viewModel.city
        weatherView.cityTextField.delegate = self
        binding()
        self.hideKeyboardWhenTappedAround()
    }

    private func binding() {
        weatherView.cityTextField.textPublisher.assign(to: \.city, on: viewModel).store(in: &cancellable)
        viewModel.$currentWeather.sink(receiveValue: {[weak self] currentWeather in self?.weatherView.tempLabel.text = currentWeather.main?.temp != nil ? "\(Int((currentWeather.main?.temp!)!)) ºC": " "}).store(in: &cancellable)}

     private var cancellable = Set<AnyCancellable>()
}
