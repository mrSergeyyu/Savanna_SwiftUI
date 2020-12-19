//
//  GalleryScrollView.swift
//  Savanna
//
//  Created by Sergey on 14.12.2020.
//

import SwiftUI

struct GalleryScrollView: View {
    //MARK: - Properties
    let animal: AnimalsModel?
    var animals: [AnimalsModel] = Bundle.main.decode("animals.json")
    
    //MARK: - Body
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ForEach(animal!.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 340, height: 215, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.bottom)
                        .padding(.leading)
                        
                }
            }
        }
    }
}

//MARK: - Preview
struct GalleryScrollView_Previews: PreviewProvider {
    static var animals: [AnimalsModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        GalleryScrollView(animal: animals[2])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
