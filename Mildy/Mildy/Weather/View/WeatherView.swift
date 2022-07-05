//
//  View.swift
//  Mildy
//
//  Created by Дмитрий Скворцов on 05.07.2022.
//

import Foundation
import UIKit

class WeatherView: UIView {
    var cityTextField: UITextField = {
        let cityTextField = UITextField()
        cityTextField.placeholder = "enter your city"
        cityTextField.isEnabled = true
        cityTextField.becomeFirstResponder()
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        return cityTextField
    }()

    var tempLabel: UILabel = {
        let tempLabel = UILabel()
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.text = "tempLabel"
        tempLabel.textAlignment = .justified
        return tempLabel
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = cyangreen
        self.addSubview(cityTextField)
        self.addSubview(tempLabel)
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            cityTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            cityTextField.centerYAnchor.constraint(equalTo: centerYAnchor),

            tempLabel.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 8),
            tempLabel.trailingAnchor.constraint(equalTo: cityTextField.trailingAnchor),
            tempLabel.leadingAnchor.constraint(equalTo: cityTextField.leadingAnchor)
        ])
    }
}

