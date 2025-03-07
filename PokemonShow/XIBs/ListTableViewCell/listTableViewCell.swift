//
//  listTableViewCell.swift
//  PokemonShow
//
//  Created by MacBook on 3/7/25.
//

import UIKit
import Kingfisher

class listTableViewCell: UITableViewCell {

    @IBOutlet weak var imgViewList: UIImageView!
    @IBOutlet weak var lblList: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgViewList.contentMode = .scaleAspectFit
    }

    func configure(with pokemon: Pokemon, imageUrl: URL?) {
        lblList.text = pokemon.name.capitalized
        imgViewList.kf.setImage(with: imageUrl, placeholder: UIImage(systemName: "square.and.arrow.up.trianglebadge.exclamationmark.fill"))
    }
    
}
