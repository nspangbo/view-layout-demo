//
//  EdgesForExtendedLayoutViewController.swift
//  ViewLayout
//
//  Created by xxxpangbo on 2019/4/30.
//  Copyright © 2019 xxxpangbo. All rights reserved.
//

import UIKit

class EdgesForExtendedLayoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 手动将导航栏设置成不透明，布局依旧基于导航栏下边界
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.extendedLayoutIncludesOpaqueBars = true

//        edgesForExtendedLayout = []
        
        let redView = UIView.init()
        redView.backgroundColor = UIColor.red
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)

        NSLayoutConstraint.init(item: redView,
                                attribute: NSLayoutConstraint.Attribute.leading,
                                relatedBy: NSLayoutConstraint.Relation.equal,
                                toItem: view,
                                attribute: NSLayoutConstraint.Attribute.leading,
                                multiplier: 1,
                                constant: 0).isActive = true
        NSLayoutConstraint.init(item: redView,
                                attribute: NSLayoutConstraint.Attribute.trailing,
                                relatedBy: NSLayoutConstraint.Relation.equal,
                                toItem: view,
                                attribute: NSLayoutConstraint.Attribute.trailing,
                                multiplier: 1,
                                constant: 0).isActive = true
        NSLayoutConstraint.init(item: redView,
                                attribute: NSLayoutConstraint.Attribute.top,
                                relatedBy: NSLayoutConstraint.Relation.equal,
                                toItem: view,
                                attribute: NSLayoutConstraint.Attribute.top,
                                multiplier: 1,
                                constant: self.topLayoutGuide.length).isActive = true
        NSLayoutConstraint.init(item: redView,
                                attribute: NSLayoutConstraint.Attribute.bottom,
                                relatedBy: NSLayoutConstraint.Relation.equal,
                                toItem: view,
                                attribute: NSLayoutConstraint.Attribute.bottom,
                                multiplier: 1,
                                constant: 0).isActive = true
    }
}
