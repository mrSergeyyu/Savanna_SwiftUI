//
//  ContentView.swift
//  Savanna
//
//  Created by Sergey on 13.12.2020.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    let animals: [AnimalsModel] = Bundle.main.decode("animals.json")
    let impact = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var buttonIsActive = false
    
    @State private var gridLayot: [GridItem] = [GridItem(.flexible())]
    @State private var numberColumns = 1
    @State private var iconImage = "square.grid.2x2"
    
    //MARK: - Functions
    
    func gridLayotSwitcher() {
        gridLayot = Array(repeating: GridItem(.flexible()), count: gridLayot.count % 3 + 1)
        numberColumns = gridLayot.count
        
        switch numberColumns {
        case 1:
            iconImage = "rectangle.grid.1x2"
        case 2:
            iconImage = "square.grid.2x2"
        case 3:
            iconImage = "square.grid.3x2"
        default:
            iconImage = "square.grid.2x2"
        }
        
    }
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            Group {
                if !buttonIsActive {
                    List {
                        CoverImagesView()
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(
                                destination: DetailAnimalView(animal: animal))
                            {
                                AnimalListview(animal: animal)
                            }//: Link
                        }//: Loop
                    }//: List
                } else {
                    ScrollView {
                        LazyVGrid(columns: gridLayot, alignment: .center, spacing: 10) {
                            ForEach(animals) {
                                animal in
                                NavigationLink(destination: DetailAnimalView(animal: animal)) {
                                    ContentGridView(animal: animal)
                                }
                            }//: Loop
                        }
                        .padding(10)
                        .animation(.easeIn)
                    }
                }//: VGrid
            }//: Group
            .navigationBarTitle("Savanna", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(alignment: .center, spacing: 16) {
                        Button(action: {
                            print("Here a standart view")
                            buttonIsActive = false
                            impact.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .foregroundColor(buttonIsActive ? .primary : .accentColor)
                        })//: 1st Button
                        Button(action: {
                            print("Here is a grid view")
                            buttonIsActive = true
                            gridLayotSwitcher()
                            impact.impactOccurred()
                        }, label: {
                            Image(systemName: iconImage)
                                .foregroundColor(buttonIsActive ? .accentColor : .primary)
                        })
                    }
                }
            }//: ToolBar
        } //: Navigation
        .navigationViewStyle(DefaultNavigationViewStyle())
    }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
