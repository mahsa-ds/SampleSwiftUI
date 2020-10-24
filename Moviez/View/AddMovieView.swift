//
//  AddView.swift
//  Moviez
//
//  Created by Mahsa Sanij on 9/5/20.
//  Copyright © 2020 Mahsa Sanij. All rights reserved.
//

import SwiftUI
import Combine

struct AddMovieView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject private var vm : AddMovieViewModel
    
    let alert : Alert
    
    init() {
        self.vm = .init()
    
        
        self.alert = Alert.init(title: Text(TextRefrences.Add.alert_title), message: Text(TextRefrences.Add.alert_message))
    }
    
    
    var body: some View {
        
        ZStack {
            
            ColorReference.primary.color.edgesIgnoringSafeArea(.all)
            
            VStack( spacing: 24 ) {
                
                SingleLineTextField(title: TextRefrences.Add.textfieldTitle,
                                hint: "",
                                error_message: TextRefrences.Add.error_title,
                                inputType: .default,
                                minLength: vm.titleMinLength,
                                maxLength: vm.titleMaxLength,
                                text: $vm.title)
                
                YearTextField(title: TextRefrences.Add.textfieldYear,
                                hint: "",
                                error_message: TextRefrences.Add.error_year,
                                fromYear: vm.yearMin ,
                                toYear: vm.yearMax,
                                text: $vm.year)
                
                SingleLineTextField(title: TextRefrences.Add.textfieldSeasons,
                                hint: "",
                                error_message: TextRefrences.Add.error_seasons,
                                inputType: .numberPad,
                                minLength: vm.numberOfSeasonsMinLength,
                                maxLength: vm.numberOfSeasonsMaxLength,
                                text: $vm.numberOfSeasons)
                
                Spacer()
                
                
                CustomButton(title: TextRefrences.Add.save,
                             isAnimating: $vm.saveTapped,
                             isExpanded: true,
                             action: {
                    
                    self.vm.saveTapped.toggle()
                    
                })
                    .alert(isPresented: $vm.addFailed, content: { () -> Alert in
                        
                        alert
                    })
                    
                .disabled(!vm.allValid)
                
                
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 52)
            .onReceive(vm.$addSucceed) { _ in
                
                self.presentationMode.wrappedValue.dismiss()

            }
            
        }
        .navigationBarTitle(TextRefrences.Add.title)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieView()
    }
}
