//
//  DetailAnimalView.swift
//  Savanna
//
//  Created by Sergey on 14.12.2020.
//

import SwiftUI

struct DetailAnimalView: View {
    //MARK: - Properties
    
    let animal: AnimalsModel?
    
    
    //MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                
                //: Image
                Image(animal!.image)
                    .resizable()
                    .scaledToFit()
                
                //: Title
                Text(animal!.name.uppercased())
                    .font(.title2)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
                    .background(Color.accentColor
                        .frame(height: 6)
                        .offset(y: 24))
                    
                //: Headline
                Text(animal!.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                    .foregroundColor(.accentColor)
                
                //: Gallery
                Group {
                    
                    SubTitleDetialView(picture: "photo.on.rectangle.angled", description: "Wildneress in Picturies")
                    GalleryScrollView(animal: animal)
                }//: Group 1
                
                Group {
                    SubTitleDetialView(picture: "questionmark.circle", description: "Did you know?")
                    FactsView(animal: animal)
                }//: Group 2
                Group {
                    SubTitleDetialView(picture: "questionmark.circle", description: "Learn all about \(animal!.name)")
                    
                    Text(animal!.description)
                        .font(.footnote)
                        .padding(.horizontal)
                        .padding(.top, -5)
                }//: Group 3
                Group {
                    SubTitleDetialView(picture: "map", description: "National parks")
                    MapDetailView()
                }//: Group 4
                Group {
                    SubTitleDetialView(picture: "info", description: "Learn more")
                    LinkDetailView(animal: animal)
                }
            }//: VStack
            .navigationBarTitle("More information about \(animal!.name)", displayMode: .inline)
        } //: Scroll
        
    }
}

//MARK: - Preview
struct DetailAnimalView_Previews: PreviewProvider {
    
    static var animals: [AnimalsModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        DetailAnimalView(animal: animals[4])
            
    }
}
