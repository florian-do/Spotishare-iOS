//
//  JoinViewController.swift
//  Spotishare
//
//  Created by DO Florian on 3/23/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import UIKit

class JoinViewController : UIViewController, UITextFieldDelegate {
    
    @IBOutlet var collection: [UILabel]!
    @IBOutlet weak var pin: UITextField!
    
    private let DEFAULT_LABEL = "_"
    private var oldLocation: Int = 0
    weak var mDelegate: JoinDelegate?
    
    @IBAction func mGesture(_ sender: Any) {
        self.pin.resignFirstResponder()
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pin.becomeFirstResponder()
        self.pin.delegate = self
        self.pin.autocorrectionType = .no
        self.pin.autocapitalizationType = UITextAutocapitalizationType.allCharacters
        self.collection = self.collection.sorted(by: {$0.tag < $1.tag})
    }

    
    @IBAction func textChange(_ sender: UITextField) {
        let location: Int = (sender.text?.count ?? 0) - 1
        let s: String = sender.text ?? DEFAULT_LABEL
        let position = (oldLocation > location) ? oldLocation : location
        
        collection[position].text = (oldLocation > location)
            ? DEFAULT_LABEL
            : String(s[safe: position] ?? "_")
        
        oldLocation = location
        
        if sender.text?.count == 4 {
            // if
            
            mDelegate?.joinRoom()
            self.pin.resignFirstResponder()
            self.dismiss(animated: true)
            // else fail + vibrate
            //sender.text = ""
            //clearPin()
            //let generator = UINotificationFeedbackGenerator()
            //generator.notificationOccurred(.error)
        }
    }
    
    private func clearPin() {
        oldLocation = 0
        for label in collection {
            label.text = "_"
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return range.location < 4
    }
}

protocol JoinDelegate: class {
    func joinRoom()
}
