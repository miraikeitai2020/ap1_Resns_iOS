//
//  GuestHome.swift
//  Resns
//
//  Created by shimotahira on 2020/09/27.
//

import UIKit

class GuestHome: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Home(_ sender: Any) {
    }
    
    
    @IBAction func Search(_ sender: Any) {
    }
    
    
    
    @IBAction func List(_ sender: Any) {
    }
    
    
    
    @IBAction func Acount(_ sender: Any) {
        performSegue(withIdentifier: "GuestAcountnext", sender: nil)
    }
    
    
    
    @IBAction func News(_ sender: Any) {
        performSegue(withIdentifier: "Newsnext", sender: nil)
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
