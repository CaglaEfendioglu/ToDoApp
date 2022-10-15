//
//  AnasayfaInteractor.swift
//  ToDoApp
//
//  Created by Cagla Efendioglu on 15.10.2022.
//

import Foundation

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func tumIsleriAl()  {
        var liste = [Yapilacaklar]()
        db?.open()
        do{
            let rs = try db!.executeQuery("SELECT * FROM yapilacaklar", values: nil)
            while rs.next() {
                let yapilacakIs = Yapilacaklar(yapilacak_id: Int(rs.string(forColumn: "yapilacak_id"))! , yapilacak_is: rs.string(forColumn: "yapilacak_is")!)
                liste.append(yapilacakIs)
            }
            
            anasayfaPresenter?.presenteraVeriGonder(yapilacaklarListesi: liste)
        }
        catch{
            print(error.localizedDescription)
        }
        db?.close()
        
    }
    
    func isAra(yapilacak_is:String) {
        var liste = [Yapilacaklar]()
        db?.open()
        
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM yapilacaklar WHERE yapilacak_is like '%\(yapilacak_is)%'", values: nil)
            
            while rs.next() {
                let yapilacakIs = Yapilacaklar(yapilacak_id: Int(rs.string(forColumn: "yapilacak_id"))! , yapilacak_is: rs.string(forColumn: "yapilacak_is")!)
                liste.append(yapilacakIs)
            }
            anasayfaPresenter?.presenteraVeriGonder(yapilacaklarListesi: liste)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func isSil(yapilacak_id:Int)  {
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE FROM yapilacaklar WHERE yapilacak_id = ?", values: [yapilacak_id])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
