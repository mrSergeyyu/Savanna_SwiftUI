//
//  LinkDetailView.swift
//  Savanna
//
//  Created by Sergey on 16.12.2020.
//

import SwiftUI

struct LinkDetailView: View {
    //MARK: - Properties
   let animal: AnimalsModel?
    
    //MARK: - Body
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Image(systemName: "arrow.up.forward.app")
                    .foregroundColor(.accentColor)
                Link(animal!.name, destination: URL(string: "https://en.wikipedia.org/wiki/\(animal!.name)")!)
                    .foregroundColor(.accentColor)
            }//: HStack
        }//: Box
        .padding(.horizontal, 20)
    }
}
//MARK: - Preview
struct LinkDetailView_Previews: PreviewProvider {
    static var animals: [AnimalsModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        LinkDetailView(animal: animals[4])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
