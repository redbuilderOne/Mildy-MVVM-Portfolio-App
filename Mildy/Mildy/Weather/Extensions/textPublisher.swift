//
//  textPublisher.swift
//  Mildy
//
//  Created by Дмитрий Скворцов on 05.07.2022.
//

import UIKit
import Combine

extension UITextField {
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self).compactMap { $0.object as? UITextField }.map { $0.text ?? "" }.eraseToAnyPublisher()
    }
}
