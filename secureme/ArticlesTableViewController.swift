//
//  ArticlesTableViewController.swift
//  secureme
//
//  Created by Alex Chan on 4/25/18.
//  Copyright © 2018 secure.me. All rights reserved.
//

import UIKit

class ArticlesTableViewController: UITableViewController {
    var source = String()
    var titles = [String]()
    var intros = [String]()
    var links = [String]()
    
    @IBOutlet weak var sourceName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sourceName.text = source
        if let path = Bundle.main.path(forResource: source, ofType: "JSON") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves);
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                    for (key, values) in jsonResult {
                        if let vals = values as? Dictionary<String, String> {
                            for (_, v) in vals {
                                if key == "Title" {
                                    titles.append(v)
                                } else if key == "Intro" {
                                    intros.append(v)
                                } else if key == "Link" {
                                    links.append(v)
                                }
                            }
                        }
                    }
                }
            } catch {
                // handle error
            }
        }
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

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 20
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell") else {return UITableViewCell()}
        cell.textLabel?.text = titles[indexPath.row]
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "articleSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "articleSegue" {
            let secondController = segue.destination as! ArticleViewController
            if let indexPath = tableView.indexPathForSelectedRow{
                let index = indexPath.row
                secondController.name = titles[index]
                secondController.i = intros[index]
                secondController.l = links[index]
            }
        }

    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
