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
    
    @IBAction func Home(_ sender: Any) {
        // storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        
        // 遷移先Homeのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "HomeScreen") as! Home
        
        // 画面遷移(プッシュ遷移)
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    
    @IBAction func Search(_ sender: Any) {
        // storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        
        // 遷移先Homeのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "SearchScreen") as! Search
        
        // 画面遷移(プッシュ遷移)
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    
    
    @IBAction func List(_ sender: Any) {
        // storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        
        // 遷移先Homeのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "ListScreen") as! List
        
        // 画面遷移(プッシュ遷移)
        self.navigationController?.pushViewController(nextView, animated: true)
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
