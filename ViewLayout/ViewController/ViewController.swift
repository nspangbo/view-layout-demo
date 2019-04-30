//
//  ViewController.swift
//  ViewLayout
//
//  Created by xxxpangbo on 2019/4/30.
//  Copyright © 2019 xxxpangbo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tableViewItems = ["edgesForExtendedLayout & UILayoutSupport",
                          "NSLayoutAnchor",
                          "Stack View"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //tableView.tableFooterView = UIView.init(frame: CGRect.zero)
        
        let vc = StackViewViewController.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = tableView.cellForRow(at: indexPath)?.textLabel?.text ?? ""
        switch title {
        case "edgesForExtendedLayout & UILayoutSupport":
            let vc = EdgesForExtendedLayoutViewController.init()
            self.navigationController?.pushViewController(vc, animated: true)
        case "NSLayoutAnchor":
            let vc = NSLayoutAnchorViewController.init()
            self.navigationController?.pushViewController(vc, animated: true)
        case "Stack View":
            let vc = StackViewViewController.init()
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            print("...")
        }
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tableViewItems[indexPath.row]
        
        return cell
    }
}
