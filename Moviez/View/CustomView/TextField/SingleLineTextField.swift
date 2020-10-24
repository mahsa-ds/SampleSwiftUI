//
//  CustomTextField.swift
//  Moviez
//
//  Created by Mahsa Sanij on 9/4/20.
//  Copyright © 2020 Mahsa Sanij. All rights reserved.
//

import SwiftUI

struct SingleLineTextField: View {
    
    let title : String
    let hint : String
    let error_message : String
    
    var inputType : UIKeyboardType = .default
    var minLength = 0
    var maxLength = 250
    
    @Binding var text : String
    
    @State private var isEditing = false
    @State private var isError = false
    
    var body: some View {
        
        
        
        return VStack(alignment: .leading , spacing: 8) {
            
            Text(title).modifier(TextFieldTitleModifier())
            
            
            
            TextField(hint, text: $text, onEditingChanged: {
                state in
                
                self.isEditing = state
                
                if !state {
                    self.isError =  (self.text.count > self.maxLength || self.text.count < self.minLength
                    )
                }
                
            }, onCommit: {
                
            })
                .keyboardType(self.inputType)
                .lineLimit(1)
                .modifier(TextFieldModifier())
                .modifier(StateModifier(isEditing: isEditing , isError: isError))
                .frame(height: 48)
            
            
            if isError
            {
                HStack {
                    
                    ImageReference.error.image.frame(width: 12, height: 12)
                    
                    Text(error_message)
                        .foregroundColor(ColorReference.red.color)
                        .font(Font.system(size: 14, weight: .light, design: .default))
                    
                }
                .padding(.leading, 10)
                .padding(.top, 4)
            }
            else {
                
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(.clear)
                    .frame(width: 12, height: 12, alignment: .center)
                    .padding(.leading, 10)
                    .padding(.top, 4)
            }
            
            
        }
    }
}

