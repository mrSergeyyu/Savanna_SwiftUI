//
//  MapDetailView.swift
//  Savanna
//
//  Created by Sergey on 16.12.2020.
//

import SwiftUI
import MapKit

struct MapDetailView: View {
    //MARK: - Properties
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    //MARK: - Body
    var body: some View {
        Map(coordinateRegion: $region)
            .frame(height: 256)
            .cornerRadius(12)
            .padding(.horizontal, 20)
            .overlay(
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .imageScale(.large)
                            .foregroundColor(.primary)
                        
                        Text("Locations ")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }//: HStack
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    )
                }//: Navigation
                .padding(.horizontal, 22)
                .padding(.vertical, 5)
                , alignment: .topTrailing
            )
    }
}

//MARK: - Preview
struct MapDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MapDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
