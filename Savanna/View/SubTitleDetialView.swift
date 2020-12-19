//
//  SubTitleDetialView.swift
//  Savanna
//
//  Created by Sergey on 15.12.2020.
//

import SwiftUI

struct SubTitleDetialView: View {
    //MARK: - Properties
    let picture: String
    let description: String
    
    //MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Image(systemName: picture)
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text(description)
                .bold()
                .font(.body)
                
            
        }//: HStack
        .padding(.bottom, -5)
    }
}

//MARK: - Preview
struct SubTitleDetialView_Previews: PreviewProvider {
    static var previews: some View {
        SubTitleDetialView(picture: "photo.on.rectangle.angled", description: "Wildneress in Picturies")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
