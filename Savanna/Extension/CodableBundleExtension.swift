//
//  CodableBundleExtension.swift
//  Savanna
//
//  Created by Sergey on 13.12.2020.
//

import Foundation
import SwiftUI

extension Bundle {
    func decode <T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Error")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError()
        }
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError()
        }
        
        return loadedData
    }
}
