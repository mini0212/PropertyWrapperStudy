//
//  ViewController.swift
//  PropertyWarpperStudy
//
//  Created by 김성민 on 2020/08/07.
//  Copyright © 2020 min. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private(set) var nameTextField: UITextField!
    @IBOutlet private(set) var phoneTextField: UITextField!
    @IBOutlet private(set) var saveButton: UIButton!
    @IBOutlet private(set) var showButton: UIButton!
    @IBOutlet private(set) var nameLabel: UILabel!
    @IBOutlet private(set) var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveButtonClicked(_ sender: UIButton) {
        let userInfo = UserInfo(name: nameTextField.text,
                                phone: phoneTextField.text)
        AppData.userInfo.insert(userInfo, at: 0)
    }
    
    @IBAction func showButtonClick(_ sender: UIButton) {
        dump(AppData.userInfo)
        nameLabel.text = AppData.userInfo.first?.name
        phoneLabel.text = AppData.userInfo.first?.phone
    }
}

