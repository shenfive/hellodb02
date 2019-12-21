//
//  Page2ViewController.swift
//  hellodb02
//
//  Created by 申潤五 on 2019/12/21.
//  Copyright © 2019 申潤五. All rights reserved.
//

import UIKit

class Page2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
