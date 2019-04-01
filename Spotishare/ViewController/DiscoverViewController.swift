//
//  DiscoverViewController.swift
//  Spotishare
//
//  Created by DO Florian on 3/24/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import UIKit

class DiscoverViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let reuseIdentifier = "discoverCellID"
    
    var selectedItem: PlaylistItem?
    var items: [PlaylistItem] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //navigationController?.setNavigationBarHidden(false, animated: false)
        APIClient.getPlaylist { result in
            guard let result = result else {
                print("Something went wrong")
                return
            }
            
            self.items = result.items
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SongsViewController {
            if let item = selectedItem {
                vc.id = item.id
                vc.name = item.name
                vc.imageUrl = item.images[0].url
                vc.type = item.type.rawValue
                vc.header = vc.type.capitalizingFirstLetter()+" by "+item.owner.displayName
            }
        }
    }
}

extension DiscoverViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let spaceAvailable = collectionView.layer.frame.size.width - (150 * 2)
        let leftInset = spaceAvailable / 4
        let rightInset = leftInset
        
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DiscoverViewCell
        cell.configureCell(item: self.items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItem = items[indexPath.item]
        self.performSegue(withIdentifier: "songsSegue", sender: nil)
    }
}
