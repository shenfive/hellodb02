//
//  Page2ViewController.swift
//  hellodb02
//
//  Created by 申潤五 on 2019/12/21.
//  Copyright © 2019 申潤五. All rights reserved.
//

import UIKit

class Page2ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var forumArray:[String] = []

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    //MARK:tableView Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forumArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "discListCell") as! DiscListTableViewCell
        cell.title.text = forumArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goDisc", sender: nil)
    }
    
    
}

//        dbRef.child("subject").observeSingleEvent(of: .value) { (snapshot) in
//            print(snapshot)
//            for item in snapshot.children{
//                if let snapshotItem = item as? DataSnapshot{
//                    var subject = snapshotItem.childSnapshot(forPath: "subject").value as! String
//                    self.forumArray.append(subject)
//                }
//            }
//            print(self.forumArray)
//            self.tableview.reloadData()
//        }
