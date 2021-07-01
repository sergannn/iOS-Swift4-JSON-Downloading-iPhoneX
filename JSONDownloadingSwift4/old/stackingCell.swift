//
//  stackingCell.swift
//  JSONDownloadingSwift4
//
//  Created by home on 30.06.2021.
//  Copyright © 2021 Xiaodan Wang. All rights reserved.
//

import Foundation
import UIKit
import LBTATools

class HorizontalStackingCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "girl.png"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Girly McGirly", font: .boldSystemFont(ofSize: 14))
    let messageLabel = UILabel(text: "Did you enjoy last night? I had a great time. Let's meet up again later this week, I'll show you what's up", font: .systemFont(ofSize: 12), textColor: .gray, numberOfLines: 2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.layer.cornerRadius = 60 / 2
        
        hstack(imageView.withSize(.init(width: 60, height: 60)),
               stack(nameLabel, messageLabel, spacing: 6),
               spacing: 16,
               alignment: .center).withMargins(.allSides(12))
        
        layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
