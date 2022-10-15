//
//  Yapilacaklardao.swift
//  ToDoApp
//
//  Created by Cagla Efendioglu on 15.10.2022.
//

import Foundation


class Yapilacaklardao {
    let db: FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    
    func tumIsleriAl() -> [Yapilacaklar] {
        var liste = [Yapilacaklar]()
        db?.open()
        do{
            let rs = try db!.executeQuery("SELECT * FROM yapilacaklar", values: nil)
            while rs.next() {
                let yapilacakIs = Yapilacaklar(yapilacak_id: Int(rs.string(forColumn: "yapilacak_id"))! , yapilacak_is: rs.string(forColumn: "yapilacak_ad")!)
                liste.append(yapilacakIs)
            }
        }
        catch{
            print(error.localizedDescription)
        }
        db?.close()
        
        return liste
    }
    
    
    func isEkle(yapilacak_id:Int,yapilacak_ad:String) {
        db?.open()
        do{
            try db!.executeQuery("INSERT INTO yapilacaklar (yapilacak_id,yapilacak_ad) VALUES (?,?)", values: [yapilacak_id,yapilacak_ad])
        }
        catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func isSil(yapilacak_id:Int) {
        db?.open()
        do{
            try db!.executeQuery("DELETE FROM yapilacaklar WHERE yapilacak_id = ? ", values: [yapilacak_id])
        }
        catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    
    func isGuncelle(yapilacak_id:Int,yapilacak_ad:String) {
        db?.open()
        do{
            try db!.executeUpdate("UPDATE kisiler SET yapilacak_ad = ? WHERE yapilacak_id = ?", values: [yapilacak_ad,yapilacak_id])
        }
        catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    
    func isArama(yapilacak_is:String) -> [Yapilacaklar] {
        var liste = [Yapilacaklar]()
        
        db?.open()
        do{
            let rs = try db!.executeQuery("SELECT * FROM yapilacaklar WHERE yapilacak_ad like '%\(yapilacak_is)%'", values: nil)
            
            while rs.next() {
                let yapilacakIs = Yapilacaklar(yapilacak_id: Int(rs.string(forColumn: "yapilacak_id"))!, yapilacak_is: rs.string(forColumn: "yapilacak_ad")!)
                liste.append(yapilacakIs)
            }
        }
        catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        
        return liste
    }
}
