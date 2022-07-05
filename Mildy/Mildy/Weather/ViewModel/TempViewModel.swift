//
//  TempViewModel.swift
//  Mildy
//
//  Created by Дмитрий Скворцов on 05.07.2022.
//

import Combine
import Foundation

final class TempViewModel: ObservableObject {
    @Published var city: String = "" // in
    @Published var currentWeather = WeatherDetail.placeholder // out

    init() {
        $city
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap { (city: String) -> AnyPublisher <WeatherDetail, Never> in
                WeatherAPI.shared.fetchWeather(for: city)
            }
            .assign(to: \.currentWeather , on: self)
            .store(in: &self.cancellableSet)
    }

    private var cancellableSet: Set<AnyCancellable> = []
}
