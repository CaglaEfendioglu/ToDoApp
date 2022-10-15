//
//  DetayInteractor.swift
//  ToDoApp
//
//  Created by Cagla Efendioglu on 15.10.2022.
//

import Foundation


class DetayInteractor : PresenterToInteractorDetayProtocol {
    
    let db:FMDatabase?
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func isGuncelle (yapilacak_id: Int, yapilacak_is: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE yapilacaklar SET yapilacak_is = ? WHERE yapilacak_id = ?", values: [yapilacak_is, yapilacak_id])
        }catch{
            print(error)
        }
        db?.close()
    }
}
