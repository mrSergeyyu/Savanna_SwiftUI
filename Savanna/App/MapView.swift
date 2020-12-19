//
//  MapView.swift
//  Savanna
//
//  Created by Sergey on 13.12.2020.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - Properties
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapSpan = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinate, span: mapSpan)
        
        return mapRegion
        
    }()
    
    var coordinates: [MapModel] = Bundle.main.decode("locations.json")
    
    //MARK: - Body
    var body: some View {
            Map(coordinateRegion: $region, annotationItems: coordinates, annotationContent: {
                item in
                MapAnnotation(coordinate: item.coordinate, content: {
                    PinMapView(location: item)
                })
            })//: Map
            .overlay(
                HStack(spacing: 15) {
                    Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                        .padding(.leading)
                        
                    VStack {
                        HStack {
                            Text("Longitude:")
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.longitude)")
                        }//: HStack
                        .padding(.top)
                        .padding(.trailing)
                        
                        Divider()
                        
                        HStack {
                            Text("Latitude:")
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.latitude)")
                        }//: HStack
                        .padding(.bottom)
                        .padding(.trailing)
                        
                    }//: VStack
                    
                }//: HStack
                .background(Color.black
                            .opacity(0.6))
                .cornerRadius(10)
                .padding()
                , alignment: .top
                
            )//: Overlay
            
            
    }
}
//MARK: - Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
