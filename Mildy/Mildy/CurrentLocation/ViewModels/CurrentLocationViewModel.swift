//
//  CurrentLocationViewModel.swift
//  Mildy
//
//  Created by Дмитрий Скворцов on 07.07.2022.
//

import Foundation

class CurrentLocationViewModel {
    var tempLabel = Dynamic("")

    func showCurrentLocationTemperature(location: String) {
        tempLabel.value = ""
    }
}
