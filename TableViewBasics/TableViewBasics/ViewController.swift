//
//  ViewController.swift
//  TableViewBasics
//
//  Created by Jeann Luiz Chuab on 17/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let data = ["France", "United States", "Brazil", "England", "Swiss", "Portugal", "Argentina"]
    let cellReuseIdentifier = "myCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? TableViewCell {
            cell.textLabel?.text = self.data[indexPath.row]
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

