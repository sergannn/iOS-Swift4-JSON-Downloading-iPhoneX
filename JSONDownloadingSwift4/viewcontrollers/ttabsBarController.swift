//
//  ttabsViewController.swift
//  JSONDownloadingSwift4
//
//  Created by ser on 18.06.2021.
//  Copyright © 2021 Xiaodan Wang. All rights reserved.
//

import UIKit
//import PopMenu

class ttabsBarController: UITabBarController {
    
    public var tId: String = ""
   
    @IBAction func topRightButtonDidTap(_ sender: UIBarButtonItem) {
    
      
          
        let menu = PopMenuViewController(sourceView: sender, actions:
            [
                PopMenuDefaultAction(title: "Action Title 1",
                                    
                                     image: UIImage(named: "icon"),
                                     didSelect: {
                                        action in print("\(action.title) is tapped") // will print out: 'Action 1 is tapped'
                }),
                PopMenuDefaultAction(title: "Action Title 2", image: UIImage(named: "icon"))
                    ])
        present(menu, animated: true, completion: nil)
    
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //let menuViewController = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func set_tid(tid: String) {
        self.tId = tid        // configure the labels, etc in the cell
    }
    func get_tid() -> String{
    
        return self.tId
    }
    
    
   
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


