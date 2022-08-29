//
//  ListInteractor.swift
//  Lesson6
//
//  Created by Ponomarev Maksim on 29.08.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import Foundation

final class ListInteractor {
    
    weak var output: ListInteractorOutput?
    private let service: ArtistService
    private var artistList: [Model.Artist] = []
    
    init(service: ArtistService) {
        self.service = service
    }
    
}

extension ListInteractor: ListInteractorInput {
    
    func obtainArtists() {
        service.fetchArtistList { [weak self] result in
            
            guard let strongSelf = self else { return }
            
            switch result {
            case let .success(list):
                strongSelf.artistList += list
                strongSelf.output?.showResults(strongSelf.artistList) case let .failure(error):
                strongSelf.output?.showError(error) }
        }
    }
    
    func obtainArtist(at index: Int) -> Model.Artist? { guard index < artistList.count else { return nil } return artistList[index]
    }
    
}
