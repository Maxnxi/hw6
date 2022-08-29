//
//  ListAssembly.swift
//  Lesson6
//
//  Created by Maksim Ponomarev on 06.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import UIKit

class ListAssembly {
    static func assembly() -> UIViewController {
        let view = ListViewController()
        let presenter = ListPresenter()
        let interactor = ListInteractor(service: ArtistServiceImpl())
        let router = ListRouter()

        view.output = presenter
        view.router = router
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter
        return view
    }
}

