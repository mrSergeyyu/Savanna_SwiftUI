//
//  VideoInnerView.swift
//  Savanna
//
//  Created by Sergey on 16.12.2020.
//

import SwiftUI
import AVKit

struct VideoInnerView: View {
    //MARK: - Properties
   let video: VideosModel?
    
    //MARK: - Body
    var body: some View {
        NavigationView {
        VideoPlayer(player: playVideo(fileName: video!.id, fileFormat: ".mp4"))
            .overlay(Image("logo")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding()
                     , alignment: .top
            )
            .foregroundColor(.accentColor)
            .navigationBarTitle(video!.name, displayMode: .inline)
        }
    }
}

//MARK: - Preview
struct VideoInnerView_Previews: PreviewProvider {
    static var videos: [VideosModel] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoInnerView(video: videos[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
