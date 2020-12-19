//
//  GalleryView.swift
//  Savanna
//
//  Created by Sergey on 13.12.2020.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - Properties
    var animals: [AnimalsModel] = Bundle.main.decode("animals.json")
    
    let userImpact = UIImpactFeedbackGenerator(style: .medium)
    
    @State var selectedAnimal = "lion"
    @State var gridNumberColoms: Double = 3.0
    @State var gridLayot : [GridItem] = [GridItem(.flexible())]
    
    func gridSwitch() {
        gridLayot = Array(repeating: .init(.flexible()), count: Int(gridNumberColoms))
    }
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    Image(selectedAnimal)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 5))
                    
                    Slider(value: $gridNumberColoms, in: 2...4, step: 1)
                        .padding(.vertical, 20)
                        .onChange(of: gridNumberColoms, perform: { value in
                            gridSwitch()
                        })//MARK: Slider
                    
                    LazyVGrid(columns: gridLayot, alignment: .center, spacing: 10, content: {
                        ForEach(animals) { item in
                            Image(item.image)
                                .resizable().scaledToFit()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                                .onTapGesture {
                                    selectedAnimal = item.image
                                    userImpact.impactOccurred()
                                }
                        }
                        
                    })//: Grid
                    .animation(.easeIn)
                    .onAppear(perform: {
                        gridSwitch()
                    })
                    .padding(.vertical, 50)
                    .padding(.horizontal, 15)
                }//: VStack
                .padding(.horizontal, 10)
            }//: Scroll
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(MotionAnimationView())
        }
    }
}
//MARK: - Preview
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
