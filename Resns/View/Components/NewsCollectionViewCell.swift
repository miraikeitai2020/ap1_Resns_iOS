//
//  NewsCollectionViewCell.swift
//  Resns
//
//  Created by shimotahira on 2020/10/26.
//

import UIKit

import  Foundation

protocol NewsCollectionViewDelegate {
    func addButtonTaped(_ sender: UIButton)
}

class NewsCollectionViewCell: UICollectionViewCell,UIGestureRecognizerDelegate {
    var delegate: NewsCollectionViewDelegate?

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var tagButton1: UIButton!
    @IBOutlet weak var tagButton2: UIButton!
    @IBOutlet weak var tagButton3: UIButton!
    @IBOutlet weak var tagButton4: UIButton!
    
    var newsCollectionViewDelegate: NewsCollectionViewDelegate? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(model: Model) {
        titleLabel.text = model.titleLabel
        tagButton1.setTitle(model.tagLabel1, for: .normal)
        tagButton2.setTitle(model.tagLabel2, for: .normal)
        tagButton3.setTitle(model.tagLabel3, for: .normal)
        tagButton4.setTitle(model.tagLabel4, for: .normal)
        
    }
    
    private func makeSelectedBackgroundView() -> UIView {
        let view = UIView()
        //view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        //self.view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        return view
    }

    @IBAction func tag1Action(_ sender: Any) {
        newsCollectionViewDelegate?.addButtonTaped(sender as! UIButton)
    }
    @IBAction func tag2Action(_ sender: Any) {
        newsCollectionViewDelegate?.addButtonTaped(sender as! UIButton)
    }
    @IBAction func tag3Action(_ sender: Any) {
        newsCollectionViewDelegate?.addButtonTaped(sender as! UIButton)
    }
    @IBAction func tag4Action(_ sender: Any) {
        newsCollectionViewDelegate?.addButtonTaped(sender as! UIButton)
    }
    
    
    
}
