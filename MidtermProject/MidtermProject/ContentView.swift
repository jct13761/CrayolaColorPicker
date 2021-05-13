//
//  ContentView.swift
//  MidtermProject
//
//  Created by Jorrin Thacker on 3/8/21.
//

import SwiftUI
import Foundation
import Combine

struct ContentView: View {
    @State private var backgroundColor : String = "#FFFFFF"
    @State private var currentName : String = "White"
    
    
    var body: some View {
                
        NavigationView {
            ZStack {
                Rectangle()
                    .foregroundColor(Color(UIColor.init(hex: backgroundColor)))
                    .frame(width: .infinity, height: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                Group {
                    CrayonShape(mainColor: Color.blue, secondColor: Color(UIColor.systemIndigo))
                        .offset(x: -100, y: -300)
                        .rotationEffect(.degrees(30))
                    CrayonShape(mainColor: Color.red, secondColor: Color.orange)
                        .offset(x: 0, y: -310)
                        .rotationEffect(.degrees(-20))
                    CrayonShape(mainColor: Color.orange, secondColor: Color.yellow)
                        .offset(x: -150, y: 0)
                        .rotationEffect(.degrees(85))
                    CrayonShape(mainColor: Color(UIColor.darkGray), secondColor: Color.gray)
                        .offset(x: 250, y: 0)
                        .rotationEffect(.degrees(85))
                    CrayonShape(mainColor: Color(UIColor.systemGreen), secondColor: Color(UIColor.systemTeal))
                        .offset(x: 300, y: 0)
                        .rotationEffect(.degrees(-85))
                    CrayonShape(mainColor: Color(UIColor.magenta), secondColor: Color.pink)
                        .offset(x: -210, y: 100)
                        .rotationEffect(.degrees(-65))
                }
                VStack {
                    NavigationLink(destination: crayolaColors(currentName: $currentName, colorHexString: $backgroundColor)){
                        Image("crayola3")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 150)
                            .clipShape(Ellipse())
                            .overlay(
                                StrokeText(text: "Crayola Color Picker", width: 2, color: Color.black)
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                            )
                            .padding()
                    }
                    NavigationLink(destination: info(curColor: backgroundColor)){
                        HStack {
                            Text("Info")
                            Image(systemName: "info.circle")
                        }
                    }
                    .buttonStyle(bStyle(color1: Color.black, color2: Color.blue, fontColor: Color.white))
                }
                .padding()
                .background(Color.black.opacity(0.3))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct bStyle: ButtonStyle {
    var color1 = Color.blue
    var color2 = Color.blue
    var fontColor = Color.black
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            //            .frame(minWidth: 0, maxWidth: 300)
            .padding()
            .font(.largeTitle)
            .foregroundColor(fontColor)
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [color1, color2, color1]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 15)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
