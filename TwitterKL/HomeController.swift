//
//  HomeController.swift
//  TwitterKL
//
//  Created by Kelvin Leung on 19/08/2017.
//  Copyright © 2017 Kelvin Leung. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController {
    
    let cellId = "cellId"
    let headerId = "headerId"
    let footerId = "footerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.green
        collectionView?.register(WordCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    // dequeue cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    // dequeue header and footer
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath)
            header.backgroundColor = UIColor.brown
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId, for: indexPath)
            footer.backgroundColor = UIColor.orange
            return footer
        }
    }
    
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    // cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    // header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    // footer size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
}

// cell class
class WordCell: UICollectionViewCell {
    
    let wordLabel: UILabel = {
        let label = UILabel()
        label.text = "Test Test Test"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = UIColor.yellow
        addSubview(wordLabel)
        
        NSLayoutConstraint.activate([
            wordLabel.topAnchor.constraint(equalTo: self.topAnchor),
            wordLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            wordLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            wordLabel.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])
    }
    
}
