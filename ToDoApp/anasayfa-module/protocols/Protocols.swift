//
//  Protocols.swift
//  ToDoApp
//
//  Created by Cagla Efendioglu on 15.10.2022.
//

import Foundation

protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView:PresenterToViewAnasayfaProtocol? {get set}
    
    func isleriYukle()
    func ara(aramaKelimesi:String)
    func sil(yapilacak_id:Int)
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter:InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumIsleriAl()
    func isAra(yapilacak_is:String)
    func isSil(yapilacak_id:Int)
}

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yapilacaklarListesi:[Yapilacaklar])
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yapilacaklarListesi:[Yapilacaklar])
}

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref:Anasayfa)
}
