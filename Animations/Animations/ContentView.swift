//
//  ContentView.swift
//  Animations
//
//  Created by Jonathan Meixueiro on 13/12/22.
//

import SwiftUI

//Custom Transition
struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading),
                  identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    @State private var animationAmount_1_1 = 1.0
    @State private var animationAmount_1_2 = 1.0
    @State private var animationAmount_2_1 = 1.0
    @State private var animationAmount_3_1 = 0.0
    
    @State private var enabled_1 = false
    @State private var dragAmount_1 = CGSize.zero
    
    let letters = Array("Hello, SwiftUI")
    @State private var enabled_2 = false
    @State private var dragAmount_2 = CGSize.zero
    @State private var isShowingRed = false
    
    @State private var isShowingBrown = false
    
    var body: some View {
        VStack {
            HStack {
                //ShapeChange Button
                Button("Tap Me") {
                    enabled_1.toggle()
                }
                .frame(width: 100, height: 100)
                .background(enabled_1 ? .gray : .black)
                .animation(.default, value: enabled_1)
                .foregroundColor(enabled_1 ? .black : .white)
                .clipShape(
                    RoundedRectangle(cornerRadius: enabled_1 ? 40 : 0))
                .animation(.interpolatingSpring(stiffness: 10, damping: 0.5), value: enabled_1)
                
                //Post-it button
                ZStack {
                    Rectangle()
                        .fill(.pink)
                        .frame(width: 100, height: 100)
                    
                    if isShowingBrown {
                        Rectangle()
                            .fill(.pink)
                            .frame(width: 100, height: 100)
                            .transition(.pivot)
                    }

                }
                .onTapGesture {
                    withAnimation {
                        isShowingBrown.toggle()
                    }
                }
            }
            
            // Buttons
            VStack {
                Stepper("Scale green", value: $animationAmount_2_1.animation(
                    .easeInOut(duration: 0.4)
                        .repeatCount(3, autoreverses: true)
                ), in: 1...3)
                
                // Rail Button
                HStack {
                    Button("Tap Me") {
                        withAnimation {
                            isShowingRed.toggle()
                        }
                    }
                    
                    if isShowingRed {
                        Rectangle()
                            .fill(.red)
                            .frame(width: 100, height: 100)
                            .transition(.asymmetric(insertion: .scale, removal: .opacity))
                    }
                }
                //Green and Yellow
                HStack {
                    // Green
                    Button("Tap me") {
                        animationAmount_2_1 += 0.1
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
            
            
            VStack {
                //Snake
                HStack(spacing: 0) {
                    ForEach(0..<letters.count) { num in
                        Text(String(letters[num]))
                            .padding(5)
                            .font(.title)
                            .background(enabled_2 ? .blue : .red)
                            .offset(dragAmount_2)
                            .animation(
                                .default.delay(Double(num) / 20),
                                value: dragAmount_2)
                    }
                }
                .gesture(
                    DragGesture()
                        .onChanged { dragAmount_2 = $0.translation }
                        .onEnded { _ in
                            dragAmount_2 = .zero
                            enabled_2.toggle()
                        }
                )
                //Card
                LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomLeading)
                    .frame(width: 150, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(dragAmount_1)
                    .gesture(
                        DragGesture()
                            .onChanged { dragAmount_1 = $0.translation }
                            .onEnded { _ in
                                withAnimation {
                                    dragAmount_1 = .zero
                                }
                            }
                    )
            } // Card and Snake
        } // VStack whole buttons
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
