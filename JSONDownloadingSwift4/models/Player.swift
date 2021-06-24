//
//  Actor.swift
//  JSONDownloadingSwift4
//
//  Created by Xiaodan Wang on 9/20/17.
//  Copyright © 2017 Xiaodan Wang. All rights reserved.
//

import UIKit

class Players: Codable {
    let players: [Player]
    
    init(players: [Player]) {
        self.players = players
    }
}


class Player: Codable {
    let name: String
    let elo: String
   /* let description: String
    let dob: String
    let country: String
    let height: String
    let spouse: String
    let children: String
    let image: String*/
    
    init(name: String, elo: String, dob: String, country: String, height: String, spouse: String, children: String, image: String) {
        self.name = name
        self.elo = elo
      /*  self.description = description
        self.dob = dob
        self.country = country
        self.height = height
        self.spouse = spouse
        self.children = children
        self.image = image*/
    }
}
