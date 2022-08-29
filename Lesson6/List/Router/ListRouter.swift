//
//  ListRouter.swift
//  Lesson6
//
//  Created by Ponomarev Maksim on 29.08.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import UIKit

final class ListRouter {
    weak var view: UIViewController?
}

extension ListRouter: ListRouterInput {
    func gotoDetails(artist id: Int) {
        let details = DetailAssembly.assemble(artistId: id)
        view?.navigationController?.pushViewController(details,
                                                       animated: true)
    }
}
