//
//  FactsView.swift
//  Savanna
//
//  Created by Sergey on 16.12.2020.
//

import SwiftUI

struct FactsView: View {
    //MARK: - Properties
    let animal: AnimalsModel?
    
    //MARK: - Body
    var body: some View {
        GroupBox {
            TabView {
            ForEach(animal!.fact, id: \.self) { item in
                Text(item)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 10)
            }
            }//: Tab
        }//: Box
        .tabViewStyle(PageTabViewStyle())
        .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        .padding(.horizontal)
        
}
}

//MARK: - Preview
struct FactsView_Previews: PreviewProvider {
    static var animals: [AnimalsModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        FactsView(animal: animals[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
