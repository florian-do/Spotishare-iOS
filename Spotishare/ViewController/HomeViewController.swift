//
//  ViewController.swift
//  Spotishare
//
//  Created by DO Florian on 3/23/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, JoinDelegate, SpotifyDelegate {

    @IBOutlet weak var loading: UIVisualEffectView!
    @IBOutlet weak var join: UIButton!
    @IBOutlet weak var create: UIButton!
    var i : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loading.isHidden = true
        SpotifyClient.instance.mDelegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidLayoutSubviews() {
        join.layer.cornerRadius = join.frame.height / 2
        create.layer.cornerRadius = create.frame.height / 2
    }
    
    func joinRoom() {
        loading.isHidden = false
        SpotifyClient.instance.connect()
    }
    
    func spotifyDidSuccessfullyConnect(isMaster: Bool) {
        DispatchQueue.main.async {
            if isMaster {
                
            } else {
                self.performSegue(withIdentifier: "mainSegue", sender: nil)
            }
            //self.loading.isHidden = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let joinVC = segue.destination as? JoinViewController {
            joinVC.mDelegate = self
        }
    }
    
    @IBAction func onClick(_ sender: Any) {
        i += 1
        
        switch i {
        case 1:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
            
        case 2:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
            
        case 3:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.warning)
            
        case 4:
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        case 5:
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
        case 6:
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
            
        default:
            let generator = UISelectionFeedbackGenerator()
            generator.selectionChanged()
            i = 0
        }
    }
}
