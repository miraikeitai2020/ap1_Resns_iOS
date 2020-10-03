//
//  GuestSearch.swift
//  Resns
//
//  Created by shimotahira on 2020/09/28.
//

import UIKit

class GuestSearch: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func News(_ sender: Any) {
        performSegue(withIdentifier: "Newsnext", sender: nil)
    }
    
    
   
    @IBAction func Home(_ sender: Any) {
        
    }
    
    
    @IBAction func Search(_ sender: Any) {
        
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
        // storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        
        // 遷移先GuestAcountのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "GuestAcountScreen") as! GuestAcount
        
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
