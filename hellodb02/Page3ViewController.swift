//
//  Page3ViewController.swift
//  hellodb02
//
//  Created by 申潤五 on 2019/12/28.
//  Copyright © 2019 申潤五. All rights reserved.
//

import UIKit
import Firebase

class Page3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var msgTF: UITextField!
    
    var nickName:String = ""
    var key:String = ""
    var subject:String = ""
    var dbREF:DatabaseReference!
    var tableData:[Disc] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(nickName)
        print(key)
        print(subject)
        dbREF = Database.database().reference().child("forum/disc")
        tableview.delegate = self
        tableview.dataSource = self
        dbREF.child(key).observe(.value) { (snapshot) in
//            print(snapshot)
            self.tableData.removeAll()
            for item in snapshot.children{
                if let item = item as? DataSnapshot{
                    var theData:Disc = Disc()
                    theData.content = item.childSnapshot(forPath: "content").value as! String
                    self.tableData.append(theData)
                    
                }
            }
            self.tableview.reloadData()
        }
    }
    
    //MARK:TabelView Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "discContentTableViewCell") as! DiscContentTableViewCell
        cell.content.text = tableData[indexPath.row].content
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
        let content:[String:Any] =
            ["content":msg,
             "nickname":nickName,
             "tiemstemp":ServerValue.timestamp()]
        dbREF.child(key).childByAutoId().setValue(content)
    }
    
}

struct Disc {
    var content:String = ""
    var nickname:String = ""
    var time:String = ""
}
