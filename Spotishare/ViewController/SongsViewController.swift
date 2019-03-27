//
//  SongsViewController.swift
//  Spotishare
//
//  Created by DO Florian on 3/27/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import UIKit

class SongsViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
