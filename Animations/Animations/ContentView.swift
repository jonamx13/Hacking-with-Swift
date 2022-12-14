//
//  ContentView.swift
//  Animations
//
//  Created by Jonathan Meixueiro on 13/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount_1_1 = 1.0
    @State private var animationAmount_1_2 = 1.0
    @State private var animationAmount_2_1 = 1.0
    @State private var animationAmount_3_1 = 0.0
    
    var body: some View {
        VStack {
            
            // Buttons
            VStack {
                Stepper("Scale green", value: $animationAmount_2_1.animation(
                    .easeInOut(duration: 0.4)
                        .repeatCount(3, autoreverses: true)
                ), in: 1...5)
                
                Spacer()
                
                //Green and Yellow
                HStack {
                    // Green
                    Button("Tap me") {
                        animationAmount_2_1 += 0.2
                    }
                    .padding(50)
                    .background(.green)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .scaleEffect(animationAmount_2_1)
                    
                    // Yellow
                    Button("Tap me") {
                        withAnimation(
                            .interpolatingSpring(stiffness: 5, damping: 3)
                        ) {
                            animationAmount_3_1 += 360
                        }
                    }
                    .padding(50)
                    .background(.yellow)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .rotation3DEffect(.degrees(animationAmount_3_1),
                                      axis: (x: 0, y: 1, z:0))
                }
                //Red and Blue
                HStack {
                    Button("Watch me") {
                        // animationAmount_1_1 += 1
                    }
                    .padding(50)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(.red)
                            .scaleEffect(animationAmount_1_1)
                            .opacity(2 - animationAmount_1_1)
                            .animation(.easeInOut(duration: 1)
                                .repeatForever(autoreverses: false),
                                       value: animationAmount_1_1)
                    )
                    .onAppear {
                        animationAmount_1_1 = 2
                    }
                    Button("Tap Me") {
                        if animationAmount_1_2 <= 1 {
                            animationAmount_1_2 += 0.2
                        } else {
                            animationAmount_1_2 -= 0.2
                        }
                    }
                    .padding(50)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .scaleEffect(animationAmount_1_2)
                    .blur(radius: (animationAmount_1_2 - 1) * 10)
                    .animation(.interpolatingSpring(stiffness: 50, damping: 3), value: animationAmount_1_2)
                } // HStack Red and Blue
                Spacer()
            } // VStack buttons
        } // VStack whole buttons
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
