//
//  VideoItemView.swift
//  Savanna
//
//  Created by Sergey on 16.12.2020.
//

import SwiftUI

struct VideoItemView: View {
    //MARK: - Properties
    let video: VideosModel?
    
    
    //MARK: - Body
    var body: some View {
            HStack(spacing: 16) {
                ZStack {
                    Image(video!.id)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                        .cornerRadius(9)
                    Image(systemName: "play.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 32)
                        
                        
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text(video!.name)
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.accentColor)
                    Text(video!.headline)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }
            }//: HStack
            .padding(.top, 10)
    }
}

//MARK: - Preview
struct VideoItemView_Previews: PreviewProvider {
    static var videos: [VideosModel] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoItemView(video: videos[2])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
