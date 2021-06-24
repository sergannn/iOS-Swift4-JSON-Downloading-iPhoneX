//
//  Actor.swift
//  JSONDownloadingSwift4
//
//  Created by Xiaodan Wang on 9/20/17.
//  Copyright © 2017 Xiaodan Wang. All rights reserved.
//

import UIKit

class Tourneys: Codable {
    let tourneys: [Tourney]
    
    init(tourneys: [Tourney]) {
        self.tourneys = tourneys
    }
}


class Tourney: Codable {
    let name: String
   let href: String
   /*  let dob: String
    let country: String
    let height: String
    let spouse: String
    let children: String
    let image: String
 */
    
    init(name: String, href: String, dob: String, country: String, height: String, spouse: String, children: String, image: String) {
        self.name = name
      self.href = href
      /*    self.dob = dob
        self.country = country
        self.height = height
        self.spouse = spouse
        self.children = children
        self.image = image  */
    }
}
