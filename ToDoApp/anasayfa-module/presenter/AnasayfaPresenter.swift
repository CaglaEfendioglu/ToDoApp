//
//  AnasayfaPresenter.swift
//  ToDoApp
//
//  Created by Cagla Efendioglu on 15.10.2022.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func isleriYukle() {
        anasayfaInteractor?.tumIsleriAl()
    }
    
    func ara(aramaKelimesi: String) {
        anasayfaInteractor?.isAra(yapilacak_is: aramaKelimesi)
    }
    
    func sil(yapilacak_id: Int) {
        anasayfaInteractor?.isSil(yapilacak_id: yapilacak_id)
    }
}

extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yapilacaklarListesi: [Yapilacaklar]) {
        anasayfaView?.vieweVeriGonder(yapilacaklarListesi: yapilacaklarListesi)
    }
}
