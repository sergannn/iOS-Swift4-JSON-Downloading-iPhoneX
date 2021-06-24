//
//  Actor.swift
//  JSONDownloadingSwift4
//
//  Created by Xiaodan Wang on 9/20/17.
//  Copyright © 2017 Xiaodan Wang. All rights reserved.
//

import UIKit

class ActorCell: UITableViewCell {

    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var DOBLbl: UILabel!
    @IBOutlet var imgView: UIImageView!

    var tId: String!
    
    func configure(tourney: Tourney) {
        tId = tourney.href        // configure the labels, etc in the cell
    }
    
    func get_id() -> String{
        return tId;      // configure the labels, etc in the cell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
