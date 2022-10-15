//
//  Detay.swift
//  ToDoApp
//
//  Created by Cagla Efendioglu on 15.10.2022.
//

import UIKit

class Detay: UIViewController {
    
    @IBOutlet weak var detayTextField: UITextField!
    
    var yapilacakIs:Yapilacaklar?
    
    var detayPresenterNesnesi:ViewToPresenterDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DetayRouter.createModule(ref: self)
        
        if let y = yapilacakIs {
            detayTextField.text = y.yapilacak_is
        }
    }
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let y = yapilacakIs, let tf = detayTextField.text {
            detayPresenterNesnesi?.guncelle(yapilacak_id: y.yapilacak_id!, yapilacak_is: tf)
        }
        print("guncellendi")
    }
}

