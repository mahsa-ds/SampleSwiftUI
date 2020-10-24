//
//  CustomButton.swift
//  Moviez
//
//  Created by Mahsa Sanij on 9/4/20.
//  Copyright © 2020 Mahsa Sanij. All rights reserved.
//

import SwiftUI

private let CORNER_RADIUS : CGFloat = 20

struct CustomButton: View {
    
    let title : String
    var image : Image?
    var backgroundColor : Color? = ColorReference.orange.color
    @Binding var isAnimating : Bool
    var isExpanded : Bool = false
    
    let action : () -> Void
    
    
    
    var body: some View {
        
        
        Button(action: self.action) {
            
            HStack {
                
                self.image?
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundColor(ColorReference.primary.color)
                
                if self.isExpanded
                {
                    Spacer()
                }
                
                
                Text(self.title)
                    .foregroundColor(ColorReference.primary.color)
                
                if self.isExpanded
                {
                    Spacer()
                }
                
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(AnimatingStroke(backgroundColor: self.backgroundColor ?? ColorReference.orange.color ,isAnimating: self.$isAnimating))
            
        }
        
    }
    
}

struct AnimatingStroke : View
{
    let backgroundColor : Color
    @Binding var isAnimating : Bool
    @State private var percentage: CGFloat = .zero
    
    
    var body: some View {
        
        GeometryReader { (proxy) in
            
            RoundedRectangle(cornerRadius: CORNER_RADIUS)
                .foregroundColor(self.backgroundColor)
                .overlay( self.isAnimating ?
                    Path.init(roundedRect: proxy.frame(in: .local), cornerRadius: CORNER_RADIUS)
                        .trim(from: self.percentage, to: (self.percentage + 0.1))
                        .stroke(ColorReference.white.color, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                        .animation(.some(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false)))
                        .onAppear {
                            self.percentage = 1.0
                    } : nil)
        }
        
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Add new TV show",
                     image: ImageReference.add.image ,
                     isAnimating: .constant(true),
                     action: {
                        
        })
    }
}
