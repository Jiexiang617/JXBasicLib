//
//  ViewController.swift
//  JXBasicLib
//
//  Created by jiexiang617@gmail.com on 08/18/2017.
//  Copyright (c) 2017 jiexiang617@gmail.com. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        if indexPath.row == 0 {
            cell.textLabel?.text = "单张图片选择"
        }
        return cell
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            navigationController?.pushViewController((storyboard?.instantiateViewController(withIdentifier: "ChooseSingleImageVC"))!, animated: true)
        }
    }
}
