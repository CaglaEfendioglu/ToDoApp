//
//  AnasayfaRouter.swift
//  ToDoApp
//
//  Created by Cagla Efendioglu on 15.10.2022.
//

import Foundation

class AnasayfaRouter : PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: Anasayfa) {
        let presenter = AnasayfaPresenter()
        
        ref.anasayfaPresenterNesnesi = presenter
        
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor = AnasayfaInteractor()
        ref.anasayfaPresenterNesnesi?.anasayfaView = ref
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor?.anasayfaPresenter = presenter
    }
}
