//
//  ArtistService.swift
//  Lesson6
//
//  Created by Ponomarev Maksim on 29.08.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

protocol ArtistService {

    typealias ArtistListResult = (Result<[Model.Artist]>) -> ()
    typealias ArtistDetailResult = (Result<Model.Artist>) -> ()

    func fetchArtistList(_ completion: @escaping ArtistListResult)
    func fetchArtist(at index: Int , _ completion: @escaping ArtistDetailResult)
}

final class ArtistServiceImpl: ArtistService {

    func fetchArtistList(_ completion: @escaping ArtistListResult) {
        completion(.success(ModelStubFactory.list()))
    }

    func fetchArtist(at index: Int , _ completion: @escaping ArtistDetailResult) {
        completion(.success(ModelStubFactory.detail(index: index)!))
    }
}
