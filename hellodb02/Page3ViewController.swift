//
//  Page3ViewController.swift
//  hellodb02
//
//  Created by 申潤五 on 2019/12/28.
//  Copyright © 2019 申潤五. All rights reserved.
//

import UIKit

class Page3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var msgTF: UITextField!
    
    var nickName:String = ""
    var key:String = ""
    var subject:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(nickName)
        print(key)
        print(subject)
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    //MARK:TabelView Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "discContentTableViewCell") as! DiscContentTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    @IBAction func newMsg(_ sender: Any) {
        let msg = msgTF.text ?? ""
        if msg.count < 3{
            showAlert("請輸入三個或以上字元")
        }
        
        
    }
    
}
