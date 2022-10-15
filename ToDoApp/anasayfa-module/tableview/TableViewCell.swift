//
//  TableViewCell.swift
//  ToDoApp
//
//  Created by Cagla Efendioglu on 15.10.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var hucreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
