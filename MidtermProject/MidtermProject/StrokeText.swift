//
//  StrokeText.swift
//  MidtermProject
//
//  Created by Jorrin Thacker on 3/8/21.
//

import SwiftUI

struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color

    
    // This was taken from:
    // https://stackoverflow.com/questions/57334125/how-to-make-text-stroke-in-swiftui
    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}
