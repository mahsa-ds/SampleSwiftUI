//
//  AddMovieViewModel.swift
//  Moviez
//
//  Created by Mahsa Sanij on 9/5/20.
//  Copyright © 2020 Mahsa Sanij. All rights reserved.
//

import Foundation
import Combine

class AddMovieViewModel: ObservableObject {
    
    let titleMinLength = 2
    let titleMaxLength = 250
    let yearMin = 1900
    let yearMax = 2020
    let numberOfSeasonsMinLength = 1
    let numberOfSeasonsMaxLength = 2
    
    
    @Published var title : String = ""
    @Published var year : String = ""
    @Published var numberOfSeasons = ""
    @Published var saveTapped : Bool = false
    @Published var addSucceed : Bool = false
    @Published var addFailed : Bool = false
    @Published var allValid : Bool = false
    
    
    var movie = TVShow()
    
    var cancellables = [AnyCancellable]()
    
    
    init() {
        self.observeSaveTap()
        self.observeValidation()
    }
    
    private func observeSaveTap()
    {
        
        let cancellable1 = $saveTapped.sink { (value) in
            
            guard value else { return }
            
            self.movie.title = self.title
            self.movie.year = Int(self.year)
            self.movie.seasons = Int(self.numberOfSeasons)
            
            // Add object
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
                self.addSucceed = true
            }
            
        }
        
        cancellables.append(cancellable1)
    }
    
    private func observeValidation()
    {
        let cancellable = Publishers.CombineLatest3($title, $year, $numberOfSeasons)
            .map { (title_ , year_ , seasons_) in
                return  self.isYearValid(year_) && self.isTitleValid(title_) && self.isSeasonsValid(seasons_)
                    
        }.eraseToAnyPublisher().assign(to: \.allValid, on: self)
        
        cancellables.append(cancellable)
    }
    
    private func isTitleValid(_ text : String) -> Bool
    {
        return text.count <= self.titleMaxLength && text.count >= self.titleMinLength
    }
    
    private func isYearValid(_ text : String) -> Bool
    {
        let year = Int(text) ?? 0
        return year <= self.yearMax && year >= self.yearMin
    }
    
    private func isSeasonsValid(_ text : String) -> Bool
    {
        return text.count <= self.numberOfSeasonsMaxLength && self.numberOfSeasonsMinLength <= text.count
    }
}
