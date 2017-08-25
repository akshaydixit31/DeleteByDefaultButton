//
//  ViewController.swift
//  DeleteByDefaultButton
//
//  Created by Appinventiv Technologies on 25/08/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //============= varible's =======================
    var rowArray = ["1","2","3","4","5","6","7","8","9","10"]
    //============= Outlet's =======================
    @IBOutlet weak var dataTableView: UITableView!
    //============= ViewDidLoad method ====================
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTableView.dataSource = self
        dataTableView.delegate = self
    }
}
//==================== Class extension ================
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    // ============ TableView method's ===================
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    //-------------- cell Call Method -----------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellData", for: indexPath) as? CellData else{
            fatalError()
        }
        
        cell.dataLabel.text = rowArray[indexPath.row]
        return cell
    }
    //--------------------------------------------------
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            rowArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            print(rowArray)
        }
    }
}
//===================== Class for cell ================

class CellData: UITableViewCell{
    @IBOutlet weak var dataLabel: UILabel!
    
}
