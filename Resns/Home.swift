//
//  Home.swift
//  Resns
//
//  Created by shimotahira on 2020/09/27.
//

import UIKit

class Home: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func search(_ sender: Any) {
        performSegue(withIdentifier: "Searchnext", sender: nil)
    }
    
    
    @IBAction func List(_ sender: Any) {
        performSegue(withIdentifier: "Listnext", sender: nil)
    }
    
   
    
    @IBAction func acount(_ sender: Any) {
        performSegue(withIdentifier: "Acountnext", sender: nil)
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
