//
//  KayitInteractor.swift
//  ToDoApp
//
//  Created by Cagla Efendioglu on 15.10.2022.
//

import Foundation

class KayitInteractor : PresenterToInteractorKayitProtocol {
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func isEkle(yapilacak_ad:String) {
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO yapilacaklar (yapilacak_is) VALUES (?)", values: [yapilacak_ad])
        }catch{
            print(error)
        }
        
        db?.close()
    }
}
