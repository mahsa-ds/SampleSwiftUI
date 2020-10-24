//
//  ColorRefrence.swift
//  Moviez
//
//  Created by Mahsa Sanij on 9/4/20.
//  Copyright © 2020 Mahsa Sanij. All rights reserved.
//

import SwiftUI

enum ColorReference: String {
    case dakBlue    = "dark_blue"
    case lightBlue  = "light_blue"
    case orange     = "orange"
    case primary    = "primary"
    case white      = "white"
    case red        =  "red"
}

extension ColorReference {
    var color: Color {
        return Color(self.rawValue)
    }
    
}
