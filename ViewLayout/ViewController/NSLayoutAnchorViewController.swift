//
//  NSLayoutAnchorViewController.swift
//  ViewLayout
//
//  Created by xxxpangbo on 2019/4/30.
//  Copyright © 2019 xxxpangbo. All rights reserved.
//

import UIKit

class NSLayoutAnchorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redView = UIView.init()
        redView.backgroundColor = UIColor.red
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)
        
        redView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        redView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        redView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        redView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}
