//
//  DetayProtocols.swift
//  ToDoApp
//
//  Created by Cagla Efendioglu on 15.10.2022.
//

import Foundation

protocol ViewToPresenterDetayProtocol {
    var detayInteractor:PresenterToInteractorDetayProtocol? {get set}
    func guncelle (yapilacak_id: Int, yapilacak_is: String)
}

protocol PresenterToInteractorDetayProtocol {
    func isGuncelle (yapilacak_id: Int, yapilacak_is: String)
}

protocol PresenterToRouterDetayProtocol {
    static func createModule(ref:Detay)
}
