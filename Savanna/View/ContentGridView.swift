//
//  ContentGridView.swift
//  Savanna
//
//  Created by Sergey on 19.12.2020.
//

import SwiftUI

struct ContentGridView: View {
    //MARK: - Properties
    var animal: AnimalsModel
    
    //MARK: - Body
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(16)
    }
}
//MARK: - Preview
struct ContentGridView_Previews: PreviewProvider {
    static var animals: [AnimalsModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ContentGridView(animal: animals[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
