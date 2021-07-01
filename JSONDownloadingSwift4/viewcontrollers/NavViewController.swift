//
//  NavViewController.swift
//  JSONDownloadingSwift4
//
//  Created by home on 30.06.2021.
//  Copyright © 2021 Xiaodan Wang. All rights reserved.
//

import UIKit

class NavViewController: UINavigationController {
   public var tId: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func set_tid(tid: String) {
        self.tId = tid        // configure the labels, etc in the cell
    }
    func get_tid() -> String{
    
        return self.tId
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    //    downloadJson();
    }
    

}
