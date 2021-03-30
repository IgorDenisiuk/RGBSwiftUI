//
//  ContentView.swift
//  RGBSwiftUI
//
//  Created by Igor Denisiuk on 29.03.21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color(red: 0.3, green: 0.5, blue: 0.8)
                .ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(Color(red: redSliderValue / 255, green: greenSliderValue / 255, blue: blueSliderValue / 255))
                    .frame(width: 350, height: 200)
                    .overlay(RoundedRectangle(cornerRadius: 25.0)
                                .stroke(Color.white, lineWidth: 5))
                    .padding(20)
                SliderColor(value: $redSliderValue, sliderColor: .red)
                SliderColor(value: $greenSliderValue, sliderColor: .green)
                SliderColor(value: $blueSliderValue, sliderColor: .blue)
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

