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
    private var oldPosition: Int = 0
    weak var mDelegate: JoinDelegate?
    
    @IBAction func mGesture(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pin.becomeFirstResponder()
        self.pin.delegate = self
        self.pin.autocapitalizationType = UITextAutocapitalizationType.allCharacters
        self.collection = self.collection.sorted(by: {$0.tag < $1.tag})
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.pin.resignFirstResponder()
    }
    
    @IBAction func textChange(_ sender: UITextField) {
        let position: Int = (sender.text?.count ?? 0) - 1
        let s = sender.text ?? "_"
        var c : Character
        
        if (position >= 0) {
            c = s[s.index(s.startIndex, offsetBy: position)]
        } else {
            c = "_"
        }

        collection[(oldPosition > position) ? oldPosition : position].text = (oldPosition > position) ? "_" : String(c)
        
        oldPosition = position
        
        if sender.text?.count == 4 {
            // if
            self.dismiss(animated: true)
            mDelegate?.joinRoom()
            // else fail + vibrate
            //sender.text = ""
            //clearPin()
        }
    }
    
    private func clearPin() {
        oldPosition = 0
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
