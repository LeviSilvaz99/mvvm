//
//  ViewController.swift
//  mvvm
//
//  Created by André Levi Oliveira Silva on 11/05/22.
//

import UIKit

class ViewController: UIViewController {

    let parser = Parser()
    var contacts = [Contact]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parser.getParse {
            data in
            self.contacts = data
            self.tableView.reloadData()
        }
        tableView.dataSource = self
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].name
        return cell
    }
}
