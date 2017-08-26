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
    
    let users: [User] = {
        let tracy = User(name: "Tracy Ho", username: "@tracy_ho", bioText: "Do not mind anything that anyone tells you about anyone else. Judge everyone and everything for yourself.", profileImage: "profile")
        let kelvin = User(name: "Kelvin Leung", username: "@kelvin_l", bioText: "The most difficult thing is the decision to act, the rest is merely tenacity. The fears are paper tigers. You can do anything you decide to do. You can act to change and control your life; and the procedure, the process is its own reward.", profileImage: "kprofile")
        return [kelvin, tracy]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView?.register(UserCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(UserHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(UserFooterCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId)
        collectionView?.alwaysBounceVertical = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    // dequeue cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        if let userCell = cell as? UserCell {
            userCell.nameLabel.text = users[indexPath.row].name
            userCell.usernameLabel.text = users[indexPath.row].username
            userCell.bioTextView.text = users[indexPath.row].bioText
            userCell.profileImageView.image = UIImage(named: users[indexPath.row].profileImage)
            return userCell
        }
        return cell
    }
    
    // dequeue header and footer
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath)
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId, for: indexPath)
            return footer
        }
    }
    
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    // cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bioTextWidth = view.frame.width - 12 - 50 - 8 - 12
        let bioTextSize = CGSize(width: bioTextWidth, height: CGFloat.greatestFiniteMagnitude)
        let bioText = users[indexPath.row].bioText
        
        let labelWidth = view.frame.width - 12 - 50 - 8 - 12 - 100 - 8
        let labelSize = CGSize(width: labelWidth, height: CGFloat.greatestFiniteMagnitude)
        let nameText = users[indexPath.row].name
        let usernameText = users[indexPath.row].username
        
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        
        let estimatedBioTextFrame = NSString(string: bioText).boundingRect(with: bioTextSize, options: option, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16)], context: nil)
        let estimatedNameFrame = NSString(string: nameText).boundingRect(with: labelSize, options: option, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)], context: nil)
        let estimatedUsernameFrame = NSString(string: usernameText).boundingRect(with: labelSize, options: option, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)], context: nil)
        
        let estimatedHeight = 12 + estimatedNameFrame.height + 8 + estimatedUsernameFrame.height + 8 + estimatedBioTextFrame.height + 12
        
        return CGSize(width: view.frame.width, height: estimatedHeight)
    }
    
    // header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    // footer size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    // spacing between lines
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
