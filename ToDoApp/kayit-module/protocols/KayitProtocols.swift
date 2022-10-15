//
//  KayitProtocols.swift
//  ToDoApp
//
//  Created by Cagla Efendioglu on 15.10.2022.
//

import Foundation

protocol ViewToPresenterKayitProtocol {
    var kayitInteractor:PresenterToInteractorKayitProtocol? {get set}
    
    func ekle(yapilacak_ad:String)
}

protocol PresenterToInteractorKayitProtocol {
    func isEkle(yapilacak_ad:String)
}

protocol PresenterToRouterKayitProtocol {
    static func createModule(ref:Kayit)
}
