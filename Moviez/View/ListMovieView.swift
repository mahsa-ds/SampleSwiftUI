//
//  Listview.swift
//  Moviez
//
//  Created by Mahsa Sanij on 9/4/20.
//  Copyright © 2020 Mahsa Sanij. All rights reserved.
//

import SwiftUI

struct ListMovieView: View {
    
    @ObservedObject private var vm : ListMovieViewModel
    
    init() {
        
        self.vm = .init()
        
        
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        
    }
    
    var body: some View {
        
        ZStack {
            
            ColorReference.primary.color.edgesIgnoringSafeArea(.all)
            
            List(self.vm.list , id: \.title) { item in
                
                MovieItemView(movie: item)
            }
            .padding(.top, 42)
            
        }
        .alert(isPresented: $vm.fetchFailed, content: { () -> Alert in
            
            
            Alert.init(title: Text(TextRefrences.Add.alert_title),
                       message: Text(TextRefrences.Add.alert_message),
                       primaryButton: Alert.Button.default(Text(TextRefrences.List.alert_primary_button),
                                                           action: {
                                                            self.vm.getData()
                       }),
                       secondaryButton : Alert.Button.cancel(Text(TextRefrences.List.alert_secondary_button)))
            
            
        })
            .navigationBarTitle(TextRefrences.List.title)
            .onAppear {
                self.vm.getData()
        }
        
    }
}

struct MovieItemView : View {
    
    let movie : TVShow
    
    var body: some View
    {
        VStack(alignment: .leading, spacing: 12) {
            
            HStack {
                
                Text(movie.title ?? "")
                    .foregroundColor(ColorReference.primary.color)
                    .font(Font.system(size: 18, weight: .medium, design: .default))
                
                Spacer()
                
                
                Text(String(movie.year ?? 0))
                    .foregroundColor(ColorReference.primary.color)
                    .font(Font.system(size: 16, weight: .light, design: .default))
                
            }
            
            Text("\(String(movie.seasons ?? 0)) \(TextRefrences.List.seasons)")
                .foregroundColor(ColorReference.primary.color)
                .font(Font.system(size: 16, weight: .regular, design: .default))
        }
        .padding(.all, 16)
        .background(RoundedRectangle(cornerRadius: 8, style: .circular)
        .foregroundColor(ColorReference.lightBlue.color))
        .padding(.bottom, 24)
    }
    
}

struct Listview_Previews: PreviewProvider {
    static var previews: some View {
        ListMovieView()
    }
}
