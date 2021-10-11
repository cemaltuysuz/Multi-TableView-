//
//  ViewController.swift
//  Multi TableView
//
//  Created by cemal tüysüz on 11.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var noteBookTableView: UITableView!
    
    @IBOutlet weak var phoneTableView: UITableView!
    
    var noteBooks:[String] = [String]()
    var phones:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteBooks = ["Apple","Asus","Lenova","Monster","MSI"]
        phones = ["Apple","Samsung","Huawei","Nokia","MI"]
        
        noteBookTableView.delegate = self
        noteBookTableView.dataSource = self
        
        phoneTableView.delegate = self
        phoneTableView.dataSource = self
        
    }


}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var dataCount:Int?
        
        if tableView == noteBookTableView{
            dataCount = noteBooks.count
        }
        else if tableView == phoneTableView{
            dataCount = phones.count
        }
        return dataCount!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell?
        
        if tableView == noteBookTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "NoteBookCell",for: indexPath)
            cell?.textLabel?.text = noteBooks[indexPath.row]
        }
        else if tableView == phoneTableView{
            cell = tableView.dequeueReusableCell(withIdentifier: "PhoneCell",for: indexPath)
            cell?.textLabel?.text = phones[indexPath.row]
        }
        return cell!
    }
}

