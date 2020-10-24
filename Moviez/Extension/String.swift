//
//  String.swift
//  Moviez
//
//  Created by Mahsa Sanij on 9/4/20.
//  Copyright © 2020 Mahsa Sanij. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: LangUtil.lang, bundle: .main, value: "", comment: "")
    }
}
