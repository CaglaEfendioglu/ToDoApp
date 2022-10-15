//
//  ViewController.swift
//  ToDoApp
//
//  Created by Cagla Efendioglu on 15.10.2022.
//

import UIKit

class Anasayfa: UIViewController{
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    var yapilacaklarListesi = [Yapilacaklar]()
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        searchBar.delegate = self
        
        veritabaniKopyala()
        
        AnasayfaRouter.createModule(ref: self)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.isleriYukle()
    }
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "yapilacaklar", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabani kopyası mevcut")
        }
        else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }
            catch{
                print(error)
            }
        }
    }
}
extension Anasayfa : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yapilacaklarListesi: [Yapilacaklar]) {
        self.yapilacaklarListesi = yapilacaklarListesi
        self.tableview.reloadData()
    }
}


extension Anasayfa: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yapilacaklarListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gelenIs = yapilacaklarListesi[indexPath.row]
        let cell = tableview.dequeueReusableCell(withIdentifier: "tableviewCell", for: indexPath) as! TableViewCell
        cell.hucreLabel.text = gelenIs.yapilacak_is
        return cell
        
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){(contextualAction,view,bool) in
            let yapilacakIs = self.yapilacaklarListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yapilacakIs.yapilacak_is!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.anasayfaPresenterNesnesi?.sil(yapilacak_id: yapilacakIs.yapilacak_id!)
                self.anasayfaPresenterNesnesi?.isleriYukle()
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
            
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yapilacakIs = yapilacaklarListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yapilacakIs)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let yapilacakIs = sender as? Yapilacaklar {
                let gidilecekVC = segue.destination as! Detay
                gidilecekVC.yapilacakIs = yapilacakIs
            }
        }
    }
}
extension Anasayfa: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
    }
}

