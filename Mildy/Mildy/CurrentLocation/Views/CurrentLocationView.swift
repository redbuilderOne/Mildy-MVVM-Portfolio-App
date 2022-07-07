//
//  CurrentLocationView.swift
//  Mildy
//
//  Created by Дмитрий Скворцов on 07.07.2022.
//

import UIKit

class CurrentLocationView: UIView {
    let cityLabel: UILabel = {
        let cityLabel = UILabel()
        cityLabel.textAlignment = .center
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.textColor = pinky
        cityLabel.font = .boldSystemFont(ofSize: 28)
        return cityLabel
    }()

    var tempLabel: UILabel = {
        let tempLabel = UILabel()
        tempLabel.textAlignment = .center
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.textColor = pinky
        tempLabel.text = "temp"
        tempLabel.font = .boldSystemFont(ofSize: 28)
        return tempLabel
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(cityLabel)
        self.addSubview(tempLabel)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cityLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cityLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -170),
            tempLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tempLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 170)
        ])
    }

}
