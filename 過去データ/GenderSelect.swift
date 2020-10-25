//
//  GenderSelect.swift
//  Resns
//
//  Created by 鳥山英峻 on 2020/09/27.
//

import UIKit

class GenderSelect: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func NextAction(_ sender: Any) {
        performSegue(withIdentifier: "Birthdaynext", sender: nil)
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
