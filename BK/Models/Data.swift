//
//  Data.swift
//  mila
//
//  Created by Muhammad Nashrullah on 16/11/20.
//  Copyright © 2020 BK. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
import SwiftUI

let mileData: [Mile] = load("mileData.json")
let milestoneData: [mileCategory] = load("milestoneData.json")
let tipsData: [mileTips] = load("tipsData.json")
//
//let mileData: [Mile] = load("landmarkData.json")
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

