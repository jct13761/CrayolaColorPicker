//
//  CrayonShape.swift
//  MidtermProject
//
//  Created by Jorrin Thacker on 3/10/21.
//

import SwiftUI

struct CrayonShape: View {
    
    var mainColor : Color
    var secondColor : Color
    
    var body: some View {
        
        ZStack {
            Group {
                Rectangle() // body
                    .frame(width: 50, height: 250)
                    .foregroundColor(mainColor)
                crayonTop() // top
                    .frame(width: 50, height: 50)
                    .foregroundColor(mainColor)
                    .offset(x: 0, y: -100)
                    Rectangle() // Paper
                        .frame(width: 50, height: 210)
                        .foregroundColor(secondColor)
                    Rectangle() // top bar
                        .offset(x: 0, y: -75)
                        .frame(width: 50, height: 25)
                        .foregroundColor(Color.black)
                    Rectangle() // top bar stripe
                        .offset(x: 0, y: -75)
                        .frame(width: 50, height: 7)
                        .foregroundColor(Color(UIColor.lightGray))
                    Rectangle() // bottom bar
                        .offset(x: 0, y: 75)
                        .frame(width: 50, height: 25)
                        .foregroundColor(Color.black)
                    Rectangle() // bottom bar stripe
                        .offset(x: 0, y: 75)
                        .frame(width: 50, height: 7)
                        .foregroundColor(Color(UIColor.lightGray))
            }
        }
    }
}

struct CrayonShape_Previews: PreviewProvider {
    static var previews: some View {
        CrayonShape(mainColor: Color.blue, secondColor: Color(UIColor.cyan))
    }
}

struct crayonTop: Shape {
    let w = 45
    let h = 20
    let dw = 40
    let w_off = 5
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: w_off, y: 0))
        path.addQuadCurve(to: CGPoint(x: w, y: 0), control: CGPoint(x: (w/2), y: -90))
        path.addLine(to: CGPoint(x: w+w_off, y: 0))
        path.addLine(to: CGPoint(x: w+w_off, y: h))
        path.addLine(to: CGPoint(x: 0, y: h))
        return path
    }
}
