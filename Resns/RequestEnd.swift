//
//  RequestEnd.swift
//  Resns
//
//  Created by shimotahira on 2020/09/27.
//

import UIKit

class RequestEnd: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func HomeReturn(_ sender: Any) {
        performSegue(withIdentifier: "Homenext", sender: nil)
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
