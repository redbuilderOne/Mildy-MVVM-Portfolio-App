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
        cityTextField.isEnabled = true
        cityTextField.becomeFirstResponder()
        cityTextField.resignFirstResponder()
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        cityTextField.textAlignment = .center
        cityTextField.textColor = pinky
        cityTextField.backgroundColor = .white
        cityTextField.borderStyle = .line
        cityTextField.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 100)
        cityTextField.font = .boldSystemFont(ofSize: 28)
        cityTextField.placeholder = " your city "
        return cityTextField
    }()

    var tempLabel: UILabel = {
        let tempLabel = UILabel()
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.text = "tempLabel"
        tempLabel.textAlignment = .center
        tempLabel.textColor = pinky
        tempLabel.font = .boldSystemFont(ofSize: 24)
        return tempLabel
    }()

    private let gradientLayer = CAGradientLayer()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(cityTextField)
        self.addSubview(tempLabel)
        setupConstraints()
        gradientLayer.frame = bounds
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = frontblue
//        setupGradient()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cityTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            cityTextField.centerYAnchor.constraint(equalTo: centerYAnchor),

            tempLabel.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 8),
            tempLabel.trailingAnchor.constraint(equalTo: cityTextField.trailingAnchor),
            tempLabel.leadingAnchor.constraint(equalTo: cityTextField.leadingAnchor)
        ])
    }

    private func setupGradient() {
        self.layer.addSublayer(gradientLayer)
        gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.blue.cgColor]
    }
}

