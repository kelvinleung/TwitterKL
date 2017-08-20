//
//  UserCell.swift
//  TwitterKL
//
//  Created by Kelvin Leung on 20/08/2017.
//  Copyright © 2017 Kelvin Leung. All rights reserved.
//

import UIKit

// cell class
class UserCell: UICollectionViewCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.red
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test Test Test"
        label.backgroundColor = UIColor.white
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test Test Test"
        label.backgroundColor = UIColor.white
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Hello Hello Hello"
        textView.backgroundColor = UIColor.lightGray
        return textView
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.cyan
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
        backgroundColor = UIColor.yellow
        
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
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
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
