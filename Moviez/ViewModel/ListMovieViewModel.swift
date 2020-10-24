//
//  ListMovieViewModel.swift
//  Moviez
//
//  Created by Mahsa Sanij on 9/5/20.
//  Copyright © 2020 Mahsa Sanij. All rights reserved.
//

import Foundation
import Combine

class ListMovieViewModel: ObservableObject {
    
    
    @Published var list = [TVShow]()
    @Published var fetchFailed : Bool = false
    
    init() {
        
        self.getData()
        
    }
    
    func getData()
    {
        self.list = TVShow.generateTempObjects()
    }
}
