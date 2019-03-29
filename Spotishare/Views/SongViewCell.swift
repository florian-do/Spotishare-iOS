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
    
    
    func configureCell(item: SongItem) {
        self.expliciteView.layer.cornerRadius = 3
        self.title?.text = item.track.name
        self.artistAlbumName?.text = item.track.artists[0].name+" • "+item.track.album.name
    }
}
