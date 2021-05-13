//
//  info.swift
//  MidtermProject
//
//  Created by Jorrin Thacker on 3/8/21.
//

import SwiftUI

struct info: View {
    
    @State var curColor : String
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(UIColor.init(hex: curColor)))
                .frame(width: .infinity, height: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            Group {
                // the Center view
                CrayonPositions()
                
                // this if for the iPad view
                CrayonPositions() // top
                    .offset(x: 0, y: -800)
                CrayonPositions() // bottom
                    .offset(x: 0, y: 800)
                CrayonPositions() // left bottom
                    .offset(x: 400, y: 400)
                CrayonPositions() // left top
                    .offset(x: 400, y: -400)
                CrayonPositions() // right bottom
                    .offset(x: -400, y: 400)
                CrayonPositions() // right top
                    .offset(x: -400, y: -400)

            }
            
            
            Text("Welcome to the Crayola Color Selector! This program allows you to view a list of all the Crayola color names and values and select one from the list to be the app’s theme! There are quite a lot to those from so haven looking at them all and choosing your favorite one! Relive seeing the vast rainbow of colors that helped express your childhood creativity! !")
                .padding(20)
                .background(Color.black.opacity(0.6))
                .foregroundColor(.white)
                .font(.title3)

        }
    }
}


struct info_Previews: PreviewProvider {
    static var previews: some View {
        info(curColor: "#FFFFFF")
    }
}

struct CrayonPositions: View {
    var body: some View {
        Group {
            CrayonShape(mainColor: Color(UIColor.magenta), secondColor: Color.pink)
                .offset(x: -60, y: -250)
                .rotationEffect(.degrees(30))
            CrayonShape(mainColor: Color(UIColor.darkGray), secondColor: Color.gray)
                .offset(x: -20, y: -260)
                .rotationEffect(.degrees(-10))
            CrayonShape(mainColor: Color.red, secondColor: Color.orange)
                .offset(x: 140, y: 110)
                .rotationEffect(.degrees(5))
            CrayonShape(mainColor: Color.blue, secondColor: Color(UIColor.systemIndigo))
                .offset(x: 300, y: 20)
                .rotationEffect(.degrees(85))
            CrayonShape(mainColor: Color(UIColor.systemGreen), secondColor: Color(UIColor.systemTeal))
                .offset(x: -80, y: 50)
                .rotationEffect(.degrees(-30))
            CrayonShape(mainColor: Color.orange, secondColor: Color.yellow)
                .offset(x: -240, y: 120)
                .rotationEffect(.degrees(-55))
        }
    }
}
