//
//  MotionAnimationView.swift
//  Savanna
//
//  Created by Sergey on 18.12.2020.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - Properties
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    func randomCoordinate(coordinate: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...coordinate)
    }
    
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 10...300)
    }
    
    func randomScale() -> CGFloat {
        return CGFloat.random(in: 0.1...2.0)
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
   
    //MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(x: randomCoordinate(coordinate: geometry.size.width), y: randomCoordinate(coordinate: geometry.size.height))
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                }//:Loop
            }//: ZStack
            .onAppear(perform: {
                isAnimating = true
            })
            .drawingGroup()
        }//: Geometry
    }
}
//MARK: - Preview
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
