//
//  AnimalsModel.swift
//  Savanna
//
//  Created by Sergey on 14.12.2020.
//

import Foundation
import SwiftUI

struct AnimalsModel: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
