//
//  Movie.swift
//  Moviez
//
//  Created by Mahsa Sanij on 9/5/20.
//  Copyright © 2020 Mahsa Sanij. All rights reserved.
//

import Foundation

class TVShow {
        
    var title : String?
    var year : Int?
    var seasons : Int?

    
}

extension TVShow {
    
    static func generateTempObjects() -> [TVShow]
    {
        let item1 = TVShow()
        item1.title = "Breaking Bad"
        item1.year = 2007
        item1.seasons = 5
        
        let item2 = TVShow()
        item2.title = "Game of Thrones"
        item2.year = 2012
        item2.seasons = 9
        
        let item3 = TVShow()
        item3.title = "Friends"
        item3.year = 1993
        item3.seasons = 11
        
        return [item1, item2, item3]
    }
}
