//
//  NewsTableViewController.swift
//  secureme
//
//  Created by Alex Chan on 4/23/18.
//  Copyright © 2018 secure.me. All rights reserved.
//

import UIKit
import CoreData

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class NewsSelectionTableViewController: UITableViewController {
    var selected = [String: Bool]()
    var tableViewData = [cellData]()
    var username = String()
    var password = String()
    var email = String()
    var phone = String()
    
    @IBOutlet var selectionTableView: UITableView!
    @IBAction func submit(_ sender: Any) {
//        let user = User(username: username, password: password, email: email, phone: phone, selections: selected)
        var items = [String]()
        for (name, b) in selected {
            if b {
                items.append(name)
            }
        }
        UserDefaults.standard.set(items, forKey: username)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectionTableView.delegate = self
        selectionTableView.dataSource = self
        tableViewData = [
                        cellData(opened: false, title: "Social Media", sectionData: ["Facebook", "Instagram", "WhatsApp"]),
                        cellData(opened: false, title: "Browsers", sectionData: ["Chrome", "Firefox"]),
                         cellData(opened: false, title: "Operating Systems", sectionData: ["Windows", "MacOS", "Linux"]),
//                         cellData(opened: false, title: "Laptops", sectionData: ["MacBook Pro", "Microsoft Surface Pro"]),
                         cellData(opened: false, title: "Mobile", sectionData: ["iPhone", "Galaxy"]),
//                         cellData(opened: false, title: "Banks", sectionData: ["Bank of America", "Wells Fargo"]),
                         cellData(opened: false, title: "Cryptocurrency", sectionData: ["Bitcoin", "Ethereum"])]
        
        for item in tableViewData {
            for title in item.sectionData {
                selected[title] = false
            }
        }
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
//        newUser.setValue(username, forKey: "username")
//        newUser.setValue(password, forKey: "password")
//        newUser.setValue(email, forKey: "email")
//        newUser.setValue(phone, forKey: "phone")
//
//        do {
//            try context.save()
//            print("Saved User")
//        } catch {
//            print("Error saving user")
//        }

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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
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
    
//    override func viewWillAppear(_ animated: Bool) {
////        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
//        super.viewWillAppear(animated)
//
//        // Add a background view to the table view
//        let backgroundImage = UIImage(named: "Image")
//        let imageView = UIImageView(image: backgroundImage)
//        self.tableView.backgroundView = imageView
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SelectionTableViewCell
            let name = tableViewData[indexPath.section].title
            cell.iconLabel.text = name
            cell.iconImage.image = UIImage(named: name)
//            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SelectionTableViewCell
            let name = tableViewData[indexPath.section].sectionData[dataIndex]
            cell.iconLabel.text = name
            cell.iconImage.image = UIImage(named: name)
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
                let curr = tableView.cellForRow(at: indexPath) as! SelectionTableViewCell
                let name = curr.iconLabel.text
                selected[name!] = false
            } else {
                tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
                let curr = tableView.cellForRow(at: indexPath) as! SelectionTableViewCell
                let name = curr.iconLabel.text
                selected[name!] = true
            }

        }

        

    }

}
