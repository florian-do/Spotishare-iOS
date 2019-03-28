//
//  SongsViewController.swift
//  Spotishare
//
//  Created by DO Florian on 3/27/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import UIKit

class SongsViewController: BaseViewController {
    
    var id: String = ""
    var name: String = ""
    var imageUrl: String = ""
    var type: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.barStyle = .black
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.tintColor = #colorLiteral(red: 0.1137254902, green: 0.7254901961, blue: 0.3294117647, alpha: 1)
        self.navigationController!.navigationBar.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.07843137255, blue: 0.07843137255, alpha: 1)
        print("id: \(id)")
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCellID", for: indexPath) as! SongViewCell
        cell.configureCell()
        return cell
    }
}
