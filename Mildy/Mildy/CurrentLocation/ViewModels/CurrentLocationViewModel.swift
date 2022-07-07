//
//  CurrentLocationViewModel.swift
//  Mildy
//
//  Created by Дмитрий Скворцов on 07.07.2022.
//

import Foundation

class CurrentLocationViewModel {
    var cityLabel = Dynamic("")

    func showTemperature(city: String) {
       WeatherAPI.shared.fetchWeather(for: city)
        cityLabel.value = ""


    }

    func userButtonPressed(login: String, password: String) {
//        if login != User.logins[0].login || password != User.logins[0].password {
//            statusText.value = "Login Failed"
//        } else {
//            statusText.value = "Great! You Logged In"
//        }
    }
}
