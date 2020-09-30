//
//  GuestAcount.swift
//  Resns
//
//  Created by shimotahira on 2020/09/27.
//

import UIKit

class GuestAcount: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func RequestForm(_ sender: Any) {
    }
    
    
    
    @IBAction func Tutorial(_ sender: Any) {
    }
    
    
    
    @IBAction func GenreChange(_ sender: Any) {
    }
    
    
    
    @IBAction func Option(_ sender: Any) {
        performSegue(withIdentifier: "Optionnext", sender: nil)
    }
    
    @IBAction func Home(_ sender: Any) {
        // storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        
        // 遷移先GuestHomeのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "GuestHomeScreen") as! GuestHome
        
        // 画面遷移(プッシュ遷移)
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    
    @IBAction func Search(_ sender: Any) {
        // storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        
        // 遷移先GuestSearchのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "GuestSearchScreen") as! GuestSearch
        
        // 画面遷移(プッシュ遷移)
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    
    @IBAction func List(_ sender: Any) {
        // storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        
        // 遷移先GuestListのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "GuestListScreen") as! GuestList
        
        // 画面遷移(プッシュ遷移)
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    
    @IBAction func Acount(_ sender: Any) {
        
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
