//
//  ViewController.swift
//  hellodb02
//
//  Created by 申潤五 on 2019/12/21.
//  Copyright © 2019 申潤五. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var nickName: UITextField!
    @IBOutlet weak var status: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().signInAnonymously { (user, error) in
            if error == nil{
                self.status.text = "己登入"
            }else{
                self.status.text = "登入錯誤"
            }
        }
    }
    

    @IBAction func enterDisc(_ sender: Any) {
        if Auth.auth().currentUser == nil{
            showAlert("請確認網路狀態，重新開啟")
            return
        }
        
        let theNickName = nickName.text ?? ""
        if theNickName.count < 3 {
            showAlert("請輸入三個字元以上的暱稱")
            return
        }
        
        performSegue(withIdentifier: "goList", sender: self)
        
        
    }
    
}
extension UIViewController{
    func showAlert(_ msg:String){
        let alert = UIAlertController(title: "注意", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "我知道了", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
