//
//  UserCell.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 28/05/23.
//

import UIKit
import Kingfisher

final class UserCell: UITableViewCell, ViewCode {
    
    static let identifier = "UserCell"
    
    private lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.UserCell.TitleLabel
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imgIcon: UIImageView = {
        let image = UIImageView()
        image.accessibilityIdentifier = Constants.AccessibilityIdentifier.UserCell.IconImage
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var vwBackground: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = Constants.AccessibilityIdentifier.UserCell.BackgroundView
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var vwSeparator: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = Constants.AccessibilityIdentifier.UserCell.SeparatorView
        view.backgroundColor = .darkGray.withAlphaComponent(0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //-----------------------------------------------------------------------
    //  MARK: - Custom Methods
    //-----------------------------------------------------------------------
    
    func loadUI(item: User) {
        setup()
        
        backgroundColor = .clear
        selectionStyle = .none
        accessibilityIdentifier = item.login?.lowercased()
        
        if let avatar = item.avatar {
            imgIcon.kf.setImage(with: URL(string: avatar))
        }
        
        lblTitle.text = item.login
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - ViewCode Protocol
    //-----------------------------------------------------------------------
    
    func setup() {
        buildHierarchy()
        addConstraints()
    }
    
    internal func buildHierarchy() {
        addSubview(vwBackground)
        vwBackground.addSubview(lblTitle)
        vwBackground.addSubview(imgIcon)
        addSubview(vwSeparator)
    }
    
    internal func addConstraints() {
        
        NSLayoutConstraint.activate([
            vwBackground.topAnchor.constraint(equalTo: topAnchor),
            vwBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            vwBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            vwBackground.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imgIcon.centerYAnchor.constraint(equalTo: vwBackground.centerYAnchor),
            imgIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            imgIcon.heightAnchor.constraint(equalToConstant: 32),
            imgIcon.widthAnchor.constraint(equalToConstant: 32)
        ])
        
        NSLayoutConstraint.activate([
            lblTitle.leadingAnchor.constraint(equalTo: imgIcon.trailingAnchor, constant: 16),
            lblTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lblTitle.centerYAnchor.constraint(equalTo: imgIcon.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            vwSeparator.leadingAnchor.constraint(equalTo: vwBackground.leadingAnchor),
            vwSeparator.trailingAnchor.constraint(equalTo: vwBackground.trailingAnchor),
            vwSeparator.bottomAnchor.constraint(equalTo: vwBackground.bottomAnchor),
            vwSeparator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
