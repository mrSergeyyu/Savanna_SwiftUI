//
//  VideosModel.swift
//  Savanna
//
//  Created by Sergey on 16.12.2020.
//

import Foundation

struct VideosModel: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var coverName: String {
        "cover-\(id)"
    }
}
