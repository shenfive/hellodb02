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
    }
    
}

