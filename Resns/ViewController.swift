//
//  ViewController.swift
//  Resns
//
//  Created by 鳥山英峻 on 2020/09/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "loginnext", sender: nil)
    }
    
    @IBAction func signupButtonAction(_ sender: Any) {
        //withIdentifierは遷移したいSegueのIdentifierを指定
        //senderは受け継ぐデータが無いため今回はnil
        performSegue(withIdentifier: "signupnext", sender: nil)
    }
    
    @IBAction func guestsButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "guestsnext", sender: nil)
    }
    
}

