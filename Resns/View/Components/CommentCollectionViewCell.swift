//
//  CommentCollectionViewCell.swift
//  Resns
//
//  Created by shimotahira on 2020/11/12.
//

import UIKit

class CommentCollectionViewCell: UICollectionViewCell {
    //var delegate: CommentCollectionViewDelegate?
    
    
    @IBOutlet weak var userIconImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var commentTextview: UITextView!
    

    //var commentCollectionViewDelegate: CommentCollectionViewDelegate? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        /*
        self.commentTextview.textAlignment = .justified
        self.commentTextview.makeTextWritingDirectionRightToLeft(true)
        self.commentTextview.makeTextWritingDirectionLeftToRight(true)
 */
    }
    
    
}
