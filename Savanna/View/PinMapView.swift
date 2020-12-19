//
//  PinMapView.swift
//  Savanna
//
//  Created by Sergey on 17.12.2020.
//

import SwiftUI

struct PinMapView: View {
    //MARK: - Properties
    var location: MapModel?
    
    @State private var animation = 0.0
    
    
    //MARK: - Body
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 53, height: 53, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
                
            
            Image(location!.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        }//: ZStack
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1.0
            }
        }
    }
}
//MARK: - Preview
struct PinMapView_Previews: PreviewProvider {
    static var locations: [MapModel] = Bundle.main.decode("locations.json")
    static var previews: some View {
        PinMapView(location: locations[5])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
