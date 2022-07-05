//
//  ViewController.swift
//  Mildy
//
//  Created by Дмитрий Скворцов on 05.07.2022.
//

import UIKit

extension ViewController: UITextFieldDelegate, UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        weatherView.cityTextField.resignFirstResponder()
        return false
    }
}
