//
//  ListPresenter.swift
//  Lesson6
//
//  Created by Maksim Ponomarev on 05.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import UIKit

final class ListPresenter: NSObject {
    weak var view: ListViewInput?
    
    var router: ListRouterInput?
    var interactor: ListInteractorInput?
}

extension ListPresenter: ListViewOutput {
    
    func viewIsReady() {
        interactor?.obtainArtists()
    }
    
}

extension ListPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let artistId = interactor?.obtainArtist(at: indexPath.row)?.id else { return }
        
        router?.gotoDetails(artist: artistId) }
}

extension ListPresenter: ListInteractorOutput {
    
    func showResults(_ results: [Model.Artist]) {
        view?.reload( results.map{ ListViewModel(title: $0.name)
            } )
    }
}
