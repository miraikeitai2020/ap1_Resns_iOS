//
//  BirthdaySetting.swift
//  Resns
//
//  Created by 鳥山英峻 on 2020/09/27.
//

import UIKit

class BirthdaySetting: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func DecisionButton(_ sender: Any) {
        performSegue(withIdentifier: "Checknext", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
