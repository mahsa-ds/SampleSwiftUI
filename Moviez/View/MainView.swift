//
//  Main.swift
//  Moviez
//
//  Created by Mahsa Sanij on 9/4/20.
//  Copyright © 2020 Mahsa Sanij. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    let listView = ListMovieView.init()
    let addView = AddMovieView.init()

    
    @State private var listTapped : Bool = false
    @State private var addTapped : Bool = false

    init() {
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
        
    }
    
    var body: some View {
        
        NavigationView {
            
            
            ZStack {
                
                ColorReference.primary.color.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    
                    VStack {
                        
                        BannerView()
                            .padding(.trailing, 24)
                            .padding(.bottom, 20)
                        
                        DescriptionView()
                            .padding(.horizontal, 24)
                            .padding(.bottom, 32)
                        
                        CustomButton(title: TextRefrences.Main.add,
                                     image: ImageReference.add.image,
                                     isAnimating : .constant(false),
                                     isExpanded: true) {
                            
                            self.addTapped.toggle()
                            
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 20)
                        
                        
                        CustomButton(title: TextRefrences.Main.list,
                                     backgroundColor: ColorReference.lightBlue.color,
                                     isAnimating: .constant(false),
                                     isExpanded: true) {
                            
                            self.listTapped.toggle()
                            
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 20)
                        
                    }
                    .padding(.top, 20)
                    
                    NavigationLink(destination: listView , isActive: $listTapped) {
                        EmptyView()
                    }
                    
                    
                    NavigationLink(destination: addView, isActive: $addTapped) {
                        EmptyView()
                    }
                    
                }
                .navigationBarTitle("TV Show Manager", displayMode: .inline)
                
            }
            
        }
        
        
    }
}

struct BannerView : View {
    
    var body: some View {
        
        
        ZStack(alignment: .bottom) {
            
            ImageReference.banner.image
                .resizable()
                .aspectRatio(CGSize(width: 352, height: 208), contentMode: .fit)
            
            
            HStack {
                
                Spacer()
                
                CustomButton(title: TextRefrences.Main.watch,
                             image: ImageReference.play.image,
                             isAnimating: .constant(false)) {
                    
                }
                .padding(.trailing, 32)
                
            }
            .alignmentGuide(.bottom) {
                d in d[.bottom] / 2
            }
            
        }
        
    }
    
}

struct DescriptionView : View {
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                Text(TextRefrences.Main.storyline)
                    .foregroundColor(ColorReference.white.color)
                    .padding(.leading, 10)
                
                
                Spacer()
                
            }
            
            ZStack(alignment: .leading) {
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(ColorReference.lightBlue.color)
                    .frame(height: 1)
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(ColorReference.orange.color)
                    .frame(width: 100, height: 2, alignment: .leading)
            }
            .padding(.bottom, 18)
            
            
            Text(TextRefrences.Main.description)
                .foregroundColor(ColorReference.lightBlue.color)
            
            
        }
        
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
