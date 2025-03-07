//
//  listTableViewCell.swift
//  PokemonShow
//
//  Created by MacBook on 3/7/25.
//

import UIKit

class listTableViewCell: UITableViewCell {

    @IBOutlet weak var imgViewList: UIImageView!
    @IBOutlet weak var lblList: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
