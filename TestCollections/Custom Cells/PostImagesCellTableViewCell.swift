//
//  PostImagesCellTableViewCell.swift
//  TestCollections
//
//  Created by Vincent Cubit on 11/13/21.
//


import UIKit


class PostImagesCellTableViewCell: UITableViewCell {
    
    
    static let id = "PostImagesCellTableViewCell"
    private var images = [ PostCell ]()

    
    private let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(PostImagesCellCollectionViewCell.self, forCellWithReuseIdentifier: PostImagesCellCollectionViewCell.id)
        collection.backgroundColor = .systemBackground
        return collection
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.collection)
        self.collection.delegate = self
        self.collection.dataSource = self
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.collection.frame = CGRect(x: 0,
                                       y: 30,
                                       width: self.contentView.frame.size.width,
                                       height: self.contentView.frame.size.height)
    }
    
    
    func configure(with image: PostCell) {
        self.images.append(image)
    }
    
    
}


extension PostImagesCellTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count

    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostImagesCellCollectionViewCell.id,
                                                            for: indexPath) as? PostImagesCellCollectionViewCell else { return UICollectionViewCell() }
        cell.image.image = self.images[indexPath.section].images
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128, height: self.frame.size.height - 30)
    }
    
    
}

