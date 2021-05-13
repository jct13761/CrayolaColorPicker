//
//  crayolaColors.swift
//  MidtermProject
//
//  Created by Jorrin Thacker on 3/8/21.
//

import SwiftUI
import Foundation
import Combine


struct crayolaColors: View {
    @ObservedObject private var crayolaColors = GetCrayolaData()
    @Binding var currentName : String
    @Binding var colorHexString : String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(UIColor.init(hex: colorHexString)))
                .frame(width: .infinity, height: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            Group {
                CrayonShape(mainColor: Color(UIColor.magenta), secondColor: Color.pink)
                    .offset(x: -40, y: -220)
                    .rotationEffect(.degrees(30))
                CrayonShape(mainColor: Color(UIColor.systemGreen), secondColor: Color(UIColor.systemTeal))
                    .offset(x: -50, y: -240)
                    .rotationEffect(.degrees(-10))
                CrayonShape(mainColor: Color.red, secondColor: Color.orange)
                    .offset(x: 140, y: 110)
                    .rotationEffect(.degrees(5))
                CrayonShape(mainColor: Color(UIColor.darkGray), secondColor: Color.gray)
                    .offset(x: 350, y: 20)
                    .rotationEffect(.degrees(85))
                CrayonShape(mainColor: Color.blue, secondColor: Color(UIColor.systemIndigo))
                    .offset(x: -80, y: 90)
                    .rotationEffect(.degrees(-30))
                CrayonShape(mainColor: Color.orange, secondColor: Color.yellow)
                    .offset(x: -240, y: 130)
                    .rotationEffect(.degrees(-55))
            }
            
            VStack {
                List {
                    ForEach(crayolaColors.name) { color in
                        let crayolaColor = Color(UIColor.init(hex: color.id))
                        HStack {
                            Spacer()
                            Button(action: {
                                self.colorHexString = color.id
                                self.currentName = color.name
                            }) {
                                CrayolaButtons(nameforButton: color.name, rgbForButton: color.rgb, hexForButton: color.id, colorforButton: crayolaColor)
                            }
                            .buttonStyle(crayolaButtonStyle())
                            Spacer()
                        }
                    }
                    .listRowBackground(Color(UIColor.init(hex: colorHexString)))
                }
                Text("Current Color is:\n" + currentName)
                    .font(.title)
                    .multilineTextAlignment(.center)
            }
            .background(Color(UIColor.init(hex: colorHexString)))
            .ignoresSafeArea(.all)
        }
        .background(Color(UIColor.init(hex: colorHexString)))
        .ignoresSafeArea(.all)
    }
}

struct CrayolaButtons: View {
    var nameforButton : String
    var rgbForButton : String
    var hexForButton : String
    var colorforButton : Color
    
    var body: some View {
        VStack(alignment: .center) {
            Text(nameforButton)
                .font(.largeTitle)
                .foregroundColor(.black)
            Text("RGB = " + rgbForButton)
            Text("HEX = " + hexForButton)
        } // VStack
        .padding(15)
        .background(colorforButton)
        .cornerRadius(60)
        .overlay(
            RoundedRectangle(cornerRadius: 60)
                .stroke(Color.black, lineWidth: 3)
        )
    }
}
struct crayolaButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
