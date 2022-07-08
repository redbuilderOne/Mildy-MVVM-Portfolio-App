//
//  CurrentLocationView.swift
//  Mildy
//
//  Created by Дмитрий Скворцов on 07.07.2022.
//

import UIKit

class CurrentLocationView: UIView {
    var cityTextField: UITextField = {
        let cityTextField = UITextField()
        cityTextField.textAlignment = .center
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        cityTextField.textColor = pinky
        cityTextField.font = .boldSystemFont(ofSize: 28)
        return cityTextField
    }()

    var tempLabel: UILabel = {
        let tempLabel = UILabel()
        tempLabel.textAlignment = .center
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.textColor = pinky
        tempLabel.text = ""
        tempLabel.font = .boldSystemFont(ofSize: 28)
        return tempLabel
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(cityTextField)
        self.addSubview(tempLabel)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cityTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cityTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -170),
            tempLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tempLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 170)
        ])
    }
}
