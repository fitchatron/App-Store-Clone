//
//  AppRowCell.swift
//  AppStoreJSON
//
//  Created by James Fitch on 24/5/19.
//  Copyright © 2019 Fitchatron. All rights reserved.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
