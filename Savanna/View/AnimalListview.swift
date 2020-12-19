//
//  AnimalListview.swift
//  Savanna
//
//  Created by Sergey on 14.12.2020.
//

import SwiftUI

struct AnimalListview: View {
    //MARK: - Properties
    let animal: AnimalsModel?
    
    //MARK: - Body
    var body: some View {
        HStack(spacing: 15) {
            Image(animal!.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90, alignment: .center)
                .padding(.leading, 4)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            VStack(alignment: .leading, spacing: 15) {
                Text(animal!.name)
                    .foregroundColor(.accentColor)
                    .bold()
                
                Text(animal!.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

//MARK: - Preview
struct AnimalListview_Previews: PreviewProvider {
    static var animals: [AnimalsModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalListview(animal: animals[3])
            .previewLayout(.sizeThatFits)
            .frame(width: 380)
    }
}
