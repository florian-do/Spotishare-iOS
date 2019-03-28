//
//  SongViewCell.swift
//  Spotishare
//
//  Created by DO Florian on 3/28/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import UIKit

class SongViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var artistAlbumName: UILabel!

    @IBOutlet weak var expliciteView: UIView!
    
    
    func configureCell() {
        self.expliciteView.layer.cornerRadius = 3
    }
}
