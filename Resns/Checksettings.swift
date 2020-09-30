//
//  Checksettings.swift
//  Resns
//
//  Created by 鳥山英峻 on 2020/09/27.
//

import UIKit

class Checksettings: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Decision(_ sender: Any) {
        // Storyboardのインスタンスの取得
        let storyboard: UIStoryboard = self.storyboard!
        
        // 遷移先GuestHomeのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "GuestHomeScreen") as! GuestHome
        
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
