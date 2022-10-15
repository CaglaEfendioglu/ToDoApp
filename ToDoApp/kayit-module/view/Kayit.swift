//
//  Kayit.swift
//  ToDoApp
//
//  Created by Cagla Efendioglu on 15.10.2022.
//

import UIKit

class Kayit: UIViewController {
    
    @IBOutlet weak var yapilacaklarTextField: UITextField!
    var kayitPresenterNesnesi:ViewToPresenterKayitProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        KayitRouter.createModule(ref: self)
    }
    
    @IBAction func buttonEkle(_ sender: Any) {
        if let yapilacakAd = yapilacaklarTextField.text  {
            kayitPresenterNesnesi?.ekle(yapilacak_ad: yapilacakAd )
        }
    }
}

