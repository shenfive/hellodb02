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
    var forumKeyArray:[String] = []
    var refDB:DatabaseReference!
    var nickName:String = ""
    var indicator:UIActivityIndicatorView = UIActivityIndicatorView()

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.frame = self.view.frame
        indicator.isHidden = false
        indicator.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        indicator.startAnimating()
        self.view.addSubview(indicator)
        tableview.delegate = self
        tableview.dataSource = self
        print(nickName)
        refDB = Database.database().reference().child("subject")
        refDB.observeSingleEvent(of: .value) { (snapshot) in
            self.forumArray.removeAll()
            self.forumKeyArray.removeAll()
            for item in snapshot.children{
                if let theItem = item as? DataSnapshot{
                    print(theItem.key)
                    if let subject = theItem.childSnapshot(forPath: "subject").value as? String{
                        self.forumArray.append(subject)
                        self.forumKeyArray.append(theItem.key)
                    }
                }
            }
            self.indicator.stopAnimating()
            self.indicator.isHidden = true
            self.tableview.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "goDisc":
            let nextVC = segue.destination as! Page3ViewController
            nextVC.nickName = self.nickName
            nextVC.subject =  forumArray[tableview.indexPathForSelectedRow!.row]
            nextVC.key = forumKeyArray[tableview.indexPathForSelectedRow!.row]
        default:
            break
        }
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
