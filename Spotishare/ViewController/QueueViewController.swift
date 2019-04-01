//
//  QueueViewController.swift
//  Spotishare
//
//  Created by DO Florian on 3/31/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import Foundation
import UIKit

class QueueViewController: MainViewController {
    
    @IBAction func mGesture(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseDB.get().firebaseDb
            .child(SpotishareSession.get().getRoomCode())
            .observe(.childAdded, with: { (snapshot) -> Void in
                let item = snapshot.value as? NSDictionary
                print("\(item?["song"] as? String ?? "")")
//                self.comments.append(snapshot)
//                self.tableView.insertRows(at: [IndexPath(row: self.comments.count-1, section: self.kSectionComments)], with: UITableView.RowAnimation.automatic)
        })
    }
}

extension QueueViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("row: \(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "QueueCellID", for: indexPath) as! QueueViewCell
        cell.configureCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.07843137255, blue: 0.07843137255, alpha: 1)
            headerView.textLabel?.textColor = .white
        }
    }
}
