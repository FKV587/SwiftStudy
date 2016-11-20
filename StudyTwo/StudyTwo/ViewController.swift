//
//  ViewController.swift
//  StudyTwo
//
//  Created by 付凯 on 2016/11/12.
//  Copyright © 2016年 付凯. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UIFont.familyNames.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init()
        cell.textLabel?.text = UIFont.familyNames[indexPath.row]
        cell.textLabel?.font = UIFont(name: (forFamilyName: UIFont.familyNames[indexPath.row]), size: 15.0)
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "字体样式", message: UIFont.familyNames[indexPath.row], preferredStyle: UIAlertControllerStyle.alert)
        let alertView1 = UIAlertAction(title: "确定", style: UIAlertActionStyle.default) { (UIAlertAction) -> Void in
            
        }
        
        alertController.addAction(alertView1)
        
        print(UIFont.familyNames[indexPath.row])
        self.present(alertController, animated: true, completion: {(void) -> Void in
            print("渣渣　")
        })
    }
    
}

