//
//  SongsViewController.swift
//  Spotishare
//
//  Created by DO Florian on 3/27/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import UIKit
import CoreData

class SongsViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerCover: UIImageView!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var headerType: UILabel!
    
    var id: String = ""
    var name: String = ""
    var imageUrl: String = ""
    var type: String = ""
    var header: String = ""
    
    var items: [SongItem] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.barStyle = .black
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.tintColor = #colorLiteral(red: 0.1137254902, green: 0.7254901961, blue: 0.3294117647, alpha: 1)
        self.navigationController!.navigationBar.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.07843137255, blue: 0.07843137255, alpha: 1)
        print("id: \(id)")
        
        self.headerCover?.sd_setImage(with: URL(string: imageUrl))
        self.headerTitle?.text = self.name
        self.headerType?.text = self.header
        
        APIClient.getPlaylistByID(id: self.id, completion: { result in
            guard let result = result else {
                print("Something went wrong")
                return
            }
            
//            RefreshStrategy.get().refresh(className: CDSong().className)
//            let context = CacheDB.get().getContext()
//            for i in result.items {
//                let song = CacheDB.get().getNewEntity(context: context, entity: EntitySong.entity.rawValue)
//                song.setValue(self.id, forKey: EntitySong.id.rawValue)
//                song.setValue(i.track.name, forKey: EntitySong.title.rawValue)
//                song.setValue(i.track.album.name, forKey: EntitySong.albumName.rawValue)
//                song.setValue(i.track.artists[0].name, forKey: EntitySong.artistsName.rawValue)
//                song.setValue(i.track.uri, forKey: EntitySong.uri.rawValue)
//            }
//
//            do {
//                try context.save()
//            } catch {
//                print("Failed saving")
//            }
            
//            let request = NSFetchRequest<NSFetchRequestResult>(entityName: CDSong.entity.rawValue)
//            request.predicate = NSPredicate(format: "id = %@", self.id)
//            
//            do {
//                let result = try context.fetch(request)
//                print("IS EMPTY : \(result.isEmpty)")
//                for data in result as! [NSManagedObject] {
//                    print(data.value(forKey: "title") as! String)
//                }
//            } catch {
//                print("Failed reading")
//            }
        
            self.items = result.items
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

extension SongsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCellID", for: indexPath) as! SongViewCell
        cell.configureCell(item: self.items[indexPath.item])
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 40
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView(frame: .zero)
//        let button = UIButton(frame: .zero)
//        view.addSubview(button)
//        view.backgroundColor = .yellow
//        button.frame = view.frame
//        return view
//    }
}
