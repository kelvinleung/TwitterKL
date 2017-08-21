//
//  UserCell.swift
//  TwitterKL
//
//  Created by Kelvin Leung on 20/08/2017.
//  Copyright © 2017 Kelvin Leung. All rights reserved.
//

import UIKit

fileprivate let themeBlue = UIColor(red: 40 / 255, green: 120 / 255, blue: 180 / 255, alpha: 1)

// cell class
class UserCell: UICollectionViewCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "profile")
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tracy Ho"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "@tracy_ho"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.gray
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Do not mind anything that anyone tells you about anyone else. Judge everyone and everything for yourself."
        textView.font = UIFont.systemFont(ofSize: 16)
        // deal with the padding
        textView.textContainerInset = UIEdgeInsets.zero
        textView.textContainer.lineFragmentPadding = 0
        textView.isEditable = false
        return textView
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = themeBlue.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 6
        button.clipsToBounds = true
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(themeBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        
        NSLayoutConstraint.activate([
            // profileImageView
            profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            // nameLabel
            nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            nameLabel.rightAnchor.constraint(equalTo: followButton.leftAnchor, constant: -8),
            nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8),
            // usernameLabel
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            usernameLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor),
            usernameLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            // bioTextView
            bioTextView.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 8),
            bioTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
            bioTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            bioTextView.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            // followButton
            followButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
            followButton.widthAnchor.constraint(equalToConstant: 100),
            followButton.heightAnchor.constraint(equalToConstant: 36),
            followButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor)
            ])
    }
    
}
