//
//  Acount.swift
//  Resns
//
//  Created by shimotahira on 2020/09/27.
//

import UIKit

class Acount: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Request(_ sender: Any) {
        performSegue(withIdentifier: "RequestFormnext", sender: nil)
    }
    
    
    
    @IBAction func Tutorial(_ sender: Any) {
    }
    
    
    
    @IBAction func GenreChange(_ sender: Any) {
    }
    
    
    @IBAction func Option(_ sender: Any) {
        performSegue(withIdentifier: "Optionnext", sender: nil)
    }
    
    
    
    @IBAction func Logout(_ sender: Any) {
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
