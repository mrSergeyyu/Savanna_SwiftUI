//
//  CoverImagesView.swift
//  Savanna
//
//  Created by Sergey on 14.12.2020.
//

import SwiftUI

struct CoverImagesView: View {
    //MARK: - Properties
    let coverImages: [CoverImages] = Bundle.main.decode("covers.json")
    
    
    //MARK: - Body
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(9)
                
            }
            
        }//: Tab
        .tabViewStyle(PageTabViewStyle())
        
    }
    
}

//MARK: - Preview
struct CoverImagesView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImagesView()
            
            .frame(width: 380, height: 260)
            .previewLayout(.sizeThatFits)
    }
}
