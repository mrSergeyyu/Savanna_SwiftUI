//
//  MainTabView.swift
//  Savanna
//
//  Created by Sergey on 13.12.2020.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
          ContentView()
            .tabItem {
                Image(systemName: "square.grid.2x2")
                Text("Browse")
            }
        MapView()
            .tabItem {
                Image(systemName: "map")
                Text("Map")
            }
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Video")
                }
        } //: Tab
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
