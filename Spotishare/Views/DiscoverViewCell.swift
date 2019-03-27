//
//  DiscoverViewCell.swift
//  Spotishare
//
//  Created by DO Florian on 3/24/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class DiscoverViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    func configureCell(item: PlaylistItem) {
//        self.cardView.layer.cornerRadius = 20.0
//        self.cardView.layer.shadowColor = UIColor.darkGray.cgColor
//        self.cardView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
//        self.cardView.layer.shadowRadius = 2.0
//        self.cardView.layer.shadowOpacity = 1.0
        self.label.text = item.name
        self.image.sd_setImage(with: URL(string: item.images[0].url), placeholderImage: #imageLiteral(resourceName: "ic_launcher"))
    }
}
