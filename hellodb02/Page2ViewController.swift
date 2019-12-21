//
//  Page2ViewController.swift
//  hellodb02
//
//  Created by 申潤五 on 2019/12/21.
//  Copyright © 2019 申潤五. All rights reserved.
//

import UIKit
import Firebase

class Page2ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var forumArray:[String] = []
    var dbRef:DatabaseReference!

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dbRef = Database.database().reference()
        tableview.delegate = self
        tableview.dataSource = self
        dbRef.child("subject").observeSingleEvent(of: .value) { (snapshot) in
            print(snapshot)
            for item in snapshot.children{
                if let snapshotItem = item as? DataSnapshot{
                    print(snapshotItem)
                }
            }
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    //MARK:tableView Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "discListCell") as! DiscListTableViewCell
        cell.title.text = "這是我自訂的 Cell"
        return cell
    }
}
