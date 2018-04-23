//
//  NewsTableViewController.swift
//  secureme
//
//  Created by Alex Chan on 4/23/18.
//  Copyright © 2018 secure.me. All rights reserved.
//

import UIKit

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class NewsTableViewController: UITableViewController {
    var selected = [String: Bool]()
    var tableViewData = [cellData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [cellData(opened: false, title: "Mobile", sectionData: ["iPhone", "Galaxy"]),
        cellData(opened: false, title: "Laptops", sectionData: ["MacBook Pro", "Microsoft Surface Pro"]),
        cellData(opened: false, title: "Banks", sectionData: ["Bank of America", "Wells Fargo"]),
        cellData(opened: false, title: "Cryptocurrency", sectionData: ["Bitcoin", "Ethereum"])]

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].title
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
            return cell

        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex]
            return cell

        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opened == true {
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            } else {
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        } else {
            if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark {
                tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
                let name = tableView.cellForRow(at: indexPath)?.textLabel!.text!
                selected[name!] = false
            } else {
                tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
                let name = tableView.cellForRow(at: indexPath)?.textLabel!.text!
                selected[name!] = true
            }

        }

        

    }

}
