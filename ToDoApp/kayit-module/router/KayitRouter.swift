//
//  KayitRouter.swift
//  ToDoApp
//
//  Created by Cagla Efendioglu on 15.10.2022.
//

import Foundation

class KayitRouter : PresenterToRouterKayitProtocol {
    static func createModule(ref: Kayit) {
        ref.kayitPresenterNesnesi = KayitPresenter()
        ref.kayitPresenterNesnesi?.kayitInteractor = KayitInteractor()
    }
}
