//
//  ImageReference.swift
//  Moviez
//
//  Created by Mahsa Sanij on 9/4/20.
//  Copyright © 2020 Mahsa Sanij. All rights reserved.
//

import SwiftUI

enum ImageReference: String {

    case banner  = "img_banner"
    case add     = "ic_add"
    case play    = "ic_play"
    case error   = "ic_error"
}

extension ImageReference {
    var image: Image {
        return Image(self.rawValue)
    }
}
