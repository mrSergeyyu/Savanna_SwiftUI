//
//  VideoListView.swift
//  Savanna
//
//  Created by Sergey on 13.12.2020.
//

import SwiftUI

struct VideoListView: View {
    //MARK: - Properties
    var videos: [VideosModel] = Bundle.main.decode("videos.json")
    //MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: VideoInnerView(video: item) ) {
                        VideoItemView(video: item)
                    }
                }
            }//: List
            .navigationBarTitle("Videos", displayMode: .inline)
            .listStyle(InsetGroupedListStyle())
            
        }//: Navigation
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}
//MARK: - Preview
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
