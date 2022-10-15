//
//  KayitPresenter.swift
//  ToDoApp
//
//  Created by Cagla Efendioglu on 15.10.2022.
//

import Foundation

class KayitPresenter : ViewToPresenterKayitProtocol {
    var kayitInteractor: PresenterToInteractorKayitProtocol?
    
    func ekle(yapilacak_ad:String) {
        kayitInteractor?.isEkle(yapilacak_ad: yapilacak_ad)
    }
}

