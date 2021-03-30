//
//  SliderColor.swift
//  RGBSwiftUI
//
//  Created by Igor Denisiuk on 30.03.21.
//

import SwiftUI

struct SliderColor: View {
    
    @Binding var value: Double
    let sliderColor: Color
    
    @State private var showAlert = false
    
    private let minValue: Double = 0
    private let maxValue: Double = 255
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 50)
                .font(.system(size: 20))
                .foregroundColor(Color.white)
            
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(sliderColor)
            
            TextField("", value: $value, formatter: NumberFormatter(), onCommit: {
                self.checkValue()
            })
            .alert(isPresented: $showAlert) {
                Alert(title: Text("WRONG VALUE!"), message: Text("Please, enter value from 0 to 255."))
            }
                .frame(width: 65)
                .font(.system(size: 20))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .keyboardType(.default)
        }
    }
    
    private func checkValue() {
        switch value {
        case ...0:
            value = 0
            showAlert.toggle()
        case 255...:
            value = 255
            showAlert.toggle()
        default:
            break
        }
    }
}

struct SliderColor_Previews: PreviewProvider {
    static var previews: some View {
        SliderColor(value: .constant(125.0), sliderColor: .red)
    }
}
