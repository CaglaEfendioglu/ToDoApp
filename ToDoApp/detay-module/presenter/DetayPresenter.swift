//
//  DetayPresenter.swift
//  ToDoApp
//
//  Created by Cagla Efendioglu on 15.10.2022.
//

import Foundation

class DetayPresenter : ViewToPresenterDetayProtocol {
    var detayInteractor: PresenterToInteractorDetayProtocol?
    
    func guncelle (yapilacak_id: Int, yapilacak_is: String) {
        detayInteractor?.isGuncelle(yapilacak_id: yapilacak_id, yapilacak_is: yapilacak_is)
    }
}
