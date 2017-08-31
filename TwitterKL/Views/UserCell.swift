//
//  UserCell.swift
//  TwitterKL
//
//  Created by Kelvin Leung on 20/08/2017.
//  Copyright © 2017 Kelvin Leung. All rights reserved.
//

import UIKit

fileprivate let themeBlue = UIColor(red: 40 / 255, green: 120 / 255, blue: 180 / 255, alpha: 1)
fileprivate let separatorLineColor = UIColor(red: 230 / 255, green: 230 / 255, blue: 230 / 255, alpha: 1)

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
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.gray
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
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
    
    let separatorLine: UIView = {
        let line = UIView()
        line.backgroundColor = separatorLineColor
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = UIColor.white
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        addSubview(separatorLine)
        
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
            followButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            // separator line
            separatorLine.rightAnchor.constraint(equalTo: self.rightAnchor),
            separatorLine.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            separatorLine.leftAnchor.constraint(equalTo: self.leftAnchor),
            separatorLine.heightAnchor.constraint(equalToConstant: 0.5)
            ])
    }
    
}

class UserHeaderCell: UICollectionViewCell {
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separatorLine: UIView = {
        let line = UIView()
        line.backgroundColor = separatorLineColor
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = UIColor.white
        
        addSubview(messageLabel)
        addSubview(separatorLine)
        
        NSLayoutConstraint.activate([
            // message label
            messageLabel.topAnchor.constraint(equalTo: self.topAnchor),
            messageLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            messageLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            // separator line
            separatorLine.rightAnchor.constraint(equalTo: self.rightAnchor),
            separatorLine.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            separatorLine.leftAnchor.constraint(equalTo: self.leftAnchor),
            separatorLine.heightAnchor.constraint(equalToConstant: 0.5)
            ])
    }
    
}

class UserFooterCell: UICollectionViewCell {
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Show me more"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = themeBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separatorLine: UIView = {
        let line = UIView()
        line.backgroundColor = separatorLineColor
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let footerBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = UIColor.clear
        
        addSubview(footerBackgroundView)
        addSubview(messageLabel)
        addSubview(separatorLine)
        
        NSLayoutConstraint.activate([
            // footer background view
            footerBackgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            footerBackgroundView.rightAnchor.constraint(equalTo: self.rightAnchor),
            footerBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            footerBackgroundView.leftAnchor.constraint(equalTo: self.leftAnchor),
            // message label
            messageLabel.topAnchor.constraint(equalTo: self.topAnchor),
            messageLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            messageLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            // separator line
            separatorLine.rightAnchor.constraint(equalTo: self.rightAnchor),
            separatorLine.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            separatorLine.leftAnchor.constraint(equalTo: self.leftAnchor),
            separatorLine.heightAnchor.constraint(equalToConstant: 0.5)
            ])
    }
    
}
