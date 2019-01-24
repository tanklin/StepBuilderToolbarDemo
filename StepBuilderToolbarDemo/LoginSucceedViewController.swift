//
//  LoginSucceedViewController.swift
//  StepBuilderToolbarDemo
//
//  Created by Tank Lin on 2019/1/23.
//  Copyright © 2019 Tank Lin. All rights reserved.
//

import UIKit

class LoginSucceedViewController: UIViewController {

    lazy var text: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 0,
                                        y: view.frame.height/2-22,
                                        width: view.frame.width,
                                        height: 44))
        lbl.text = "Login Succeed!!"
        lbl.textColor = .orange
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 40)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(text)
    }

}
