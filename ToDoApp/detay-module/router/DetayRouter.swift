//
//  DetayRouter.swift
//  ToDoApp
//
//  Created by Cagla Efendioglu on 15.10.2022.
//

import Foundation

class DetayRouter: PresenterToRouterDetayProtocol {
    static func createModule(ref: Detay) {
        ref.detayPresenterNesnesi = DetayPresenter()
        ref.detayPresenterNesnesi?.detayInteractor = DetayInteractor()
    }
}
