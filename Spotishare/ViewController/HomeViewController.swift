//
//  ViewController.swift
//  Spotishare
//
//  Created by DO Florian on 3/23/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, JoinDelegate {
    
    @IBOutlet weak var join: UIButton!
    @IBOutlet weak var create: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        join.layer.cornerRadius = join.frame.height / 2
        create.layer.cornerRadius = create.frame.height / 2
    }
    
    func joinRoom() {
        performSegue(withIdentifier: "discoverSegue", sender: nil)
        //print("joinRoom")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let joinVC = segue.destination as? JoinViewController {
            joinVC.mDelegate = self
        }
    }
}
