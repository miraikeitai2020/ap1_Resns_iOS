//
//  CommentCollectionViewCell.swift
//  Resns
//
//  Created by shimotahira on 2020/11/12.
//

import UIKit

class CommentCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var userIconImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var commentTextview: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
}
