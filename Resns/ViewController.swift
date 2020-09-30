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
        // storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        
        // 遷移先Homeのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "HomeScreen") as! Home
        
        // 画面遷移(プッシュ遷移)
        self.navigationController?.pushViewController(nextView, animated: true)
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

