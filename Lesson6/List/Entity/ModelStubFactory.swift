//
//  ModelStubFactory.swift
//  Lesson6
//
//  Created by Maksim Ponomarev on 06.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import Foundation

class ModelStubFactory {
    
    static func list() -> [Model.Artist] {
        let model = Model()
        let artistsList = model.getArtistList()
        return artistsList
    }
    
    static func detail(index: Int) -> Model.Artist? {
        let model = Model()
        let artistsList = model.getArtistList()
        let artist = artistsList.filter { $0.identifier == index }.first
        return artist
        
    }

}
