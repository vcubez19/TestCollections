//
//  PostImagesCellCollectionViewCell.swift
//  TestCollections
//
//  Created by Vincent Cubit on 11/13/21.
//


import UIKit


class PostImagesCellCollectionViewCell: UICollectionViewCell {
    
    
    static let id = "PostImagesCellCollectionViewCell"
    let image: UIImageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.image)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.image.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
    }
    
    
    func configure(with cellData: PostCell) {
        
        self.image.image = cellData.images
        
    }
    
    
}

