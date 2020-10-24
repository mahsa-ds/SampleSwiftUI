//
//  CustomTextFieldTitleModifier.swift
//  Moviez
//
//  Created by Mahsa Sanij on 9/4/20.
//  Copyright © 2020 Mahsa Sanij. All rights reserved.
//

import SwiftUI

private let TEXTFIELD_CORNER_RADIUS : CGFloat = 8
private let TEXTFIELD_BORDER_WIDTH : CGFloat = 1.5


struct TextFieldTitleModifier : ViewModifier {
    
    func body(content: Content) -> some View {
        
        return content            .foregroundColor(ColorReference.lightBlue.color)
    }
}


struct StateModifier: ViewModifier {
    
    var isEditing : Bool
    var isError : Bool
    
    func body(content: Content) -> some View {
        
        if isError {
            return content.overlay(RoundedRectangle(cornerRadius: TEXTFIELD_CORNER_RADIUS, style: .continuous)
                .stroke(ColorReference.red.color, lineWidth: TEXTFIELD_BORDER_WIDTH))
        }
        
        
        if isEditing
        {
            return content.overlay(RoundedRectangle(cornerRadius: TEXTFIELD_CORNER_RADIUS, style: .continuous)
                .stroke(ColorReference.white.color, lineWidth: TEXTFIELD_BORDER_WIDTH))
            
        }
        else {

            return content.overlay(RoundedRectangle(cornerRadius: TEXTFIELD_CORNER_RADIUS, style: .continuous)
                .stroke(Color.clear, lineWidth: TEXTFIELD_BORDER_WIDTH))
            
        }
        
        
    }
}


struct TextFieldModifier : ViewModifier {
        
    func body(content: Content) -> some View {
        return content
            .foregroundColor(ColorReference.white.color)
            .accentColor(ColorReference.white.color)
            .frame( height: 48)
            .padding(.horizontal, 8)
            .background(RoundedRectangle(cornerRadius: TEXTFIELD_CORNER_RADIUS).fill(ColorReference.dakBlue.color))
    }
}
