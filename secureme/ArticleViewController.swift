//
//  ArticleViewController.swift
//  secureme
//
//  Created by Alex Chan on 4/25/18.
//  Copyright © 2018 secure.me. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var intro: UILabel!
    @IBOutlet weak var link: UIButton!
    
    var name = String()
    var i = String()
    var l = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleName.text = name
        intro.text = i
        link.setTitle(l, for: .normal)
        titleName.lineBreakMode = .byWordWrapping
        titleName.numberOfLines = 0
        
        intro.lineBreakMode = .byWordWrapping
        intro.numberOfLines = 0
        
   
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openUrl(urlStr:String!) {
        
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func clicked(_ sender: Any) {
        openUrl(urlStr: l)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
