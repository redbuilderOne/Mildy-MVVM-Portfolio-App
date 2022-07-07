//
//  ColorSets.swift
//  Mildy
//
//  Created by Дмитрий Скворцов on 05.07.2022.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(red: (rgb >> 16) & 0xFF, green: (rgb >> 8) & 0xFF, blue: rgb & 0xFF
        )
    }
}

//MARK: - Custom Colors Set#1
let customTestColor = UIColor(red: 0xFF, green: 0xFF, blue: 0xFF)
let bluesky = UIColor(rgb: 0x206EA4)
let peachyorange = UIColor(rgb: 0xFE8F7B)
let transparentblue = UIColor(rgb: 0xE5F3FE)
let cyangreen = UIColor(rgb: 0xB3EAE3)

//MARK: - Custom Colors Set#2
let completeBlack = UIColor(rgb: 0x111111)
let almostGrey = UIColor(rgb: 0x2F2F2F)
let milkyWhite = UIColor(rgb: 0xF6F6F6)
let sandyStone = UIColor(rgb: 0xFFCB74)

