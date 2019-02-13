//
//  NumberPlayersButton.swift
//  WhoIsWinner
//
//  Created by Chinh on 2/12/19.
//  Copyright © 2019 Chinh. All rights reserved.
//

import UIKit


class NumberPlayersButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.clipsToBounds = true
//        titleLabel?.adjustsFontForContentSizeCategory = true
        backgroundColor = UIColor(red: 237/255, green: 239/255, blue: 242/255, alpha: 0.3)
        //        self.translatesAutoresizingMaskIntoConstraints = true
        self.layer.cornerRadius = self.frame.width/2
        layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8).cgColor
        layer.borderWidth = 5

    }
    
}
