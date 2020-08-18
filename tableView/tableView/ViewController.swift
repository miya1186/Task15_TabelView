//
//  ViewController.swift
//  tableView
//
//  Created by miyazawaryohei on 2020/08/17.
//  Copyright © 2020 miya. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet private var tableView: UITableView!
    private var fruitItems :[Dictionary<String, Any>] = []
    
    private let KeyName = "Name"
    private let KeyCheck = "Check"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        fruitItems = [[KeyName:"りんご",KeyCheck:false,],
                      [KeyName:"みかん",KeyCheck:true,],
                      [KeyName:"バナナ",KeyCheck:false,],
                      [KeyName:"パイナップル",KeyCheck:true,]
        ]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.fruitItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        let fruitItem = self.fruitItems[indexPath.row]
        cell.cellImage.image = nil
        
        if fruitItem[KeyCheck] as? Bool == true {
            cell.cellImage.image = UIImage(named: "checkmark")
        }
        
        cell.label.text = (fruitItem[KeyName] as? String) ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //fruitItemsのKeyCheckの値がBoolに変換できたとき、checkにBool値を代入
        if let check = fruitItems[indexPath.row][KeyCheck] as? Bool {
            //Bool値の頭に！をつけることで値を反転
            fruitItems[indexPath.row][KeyCheck] = !check
        }
        tableView.reloadData()
    }
    
    
    @IBAction func exitCancell(segue:UIStoryboardSegue){
    }
    
    
    @IBAction func exitSave(segue:UIStoryboardSegue){
        let AddVC = segue.source as! AddViewController
        let addText = AddVC.addTextField.text
        
        //空の配列が入ることを防ぐ
        if addText != ""{
            fruitItems.append([KeyName:addText!,KeyCheck:false])
        }
        tableView.reloadData()
    }
    
}

