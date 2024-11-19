//
//  tableVCELLTableViewCell.swift
//  test123
//
//  Created by Alibek Baisholanov on 15.11.2024.
//

import UIKit

class tableCellTableViewCell: UITableViewCell {

    var label = UILabel()
    
    
    func setlabel(text: String){
        label.text = text
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setConstraints()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setConstraints(){
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    

}
