//
//  RepositoryCell.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 29/05/23.
//

import UIKit

final class RepositoryCell: UITableViewCell, ViewCode {
    
    static let identifier = "RepositoryCell"
    
    private let colors: [UIColor] = [UIColor(named: "Yellow")!,
                                     UIColor(named: "Salmon")!,
                                     UIColor(named: "Purple")!,
                                     UIColor(named: "Pink")!,
                                     UIColor(named: "Orange")!,
                                     UIColor(named: "Green")!]
    
    private lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.RepositoryCell.TitleLabel
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var vwBadge: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = Constants.AccessibilityIdentifier.RepositoryCell.BadgeView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var vwBackground: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = Constants.AccessibilityIdentifier.RepositoryCell.BackgroundView
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imgIcon: UIImageView = {
        let image = UIImageView()
        image.accessibilityIdentifier = Constants.AccessibilityIdentifier.RepositoryCell.IconImage
        image.image = UIImage(named: "GithubIcon")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var imgStar: UIImageView = {
        let image = UIImageView()
        image.accessibilityIdentifier = Constants.AccessibilityIdentifier.RepositoryCell.StarImage
        image.image = UIImage(named: "Star")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var lblStars: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.RepositoryCell.StarLabel
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //-----------------------------------------------------------------------
    //  MARK: - Custom Methods
    //-----------------------------------------------------------------------
    
    func loadUI(item: Repository) {
        setup()
        
        vwBadge.backgroundColor = colors.randomElement()
        lblTitle.text = item.name
        
        if let stars = item.stars {
            lblStars.text = "\(stars)"
        }
        
        backgroundColor = .clear
        selectionStyle = .none
        accessibilityIdentifier = item.name?.lowercased()
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - ViewCode Protocol
    //-----------------------------------------------------------------------
    
    func setup() {
        buildHierarchy()
        addConstraints()
    }
    
    func buildHierarchy() {
        addSubview(vwBackground)
        vwBackground.addSubview(vwBadge)
        vwBackground.addSubview(lblTitle)
        vwBadge.addSubview(imgIcon)
        vwBackground.addSubview(imgStar)
        vwBackground.addSubview(lblStars)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            vwBackground.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            vwBackground.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            vwBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            vwBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            vwBadge.topAnchor.constraint(equalTo: vwBackground.topAnchor),
            vwBadge.leadingAnchor.constraint(equalTo: vwBackground.leadingAnchor),
            vwBadge.bottomAnchor.constraint(equalTo: vwBackground.bottomAnchor),
            vwBadge.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            imgIcon.centerXAnchor.constraint(equalTo: vwBadge.centerXAnchor),
            imgIcon.centerYAnchor.constraint(equalTo: vwBadge.centerYAnchor),
            imgIcon.heightAnchor.constraint(equalToConstant: 30),
            imgIcon.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            lblTitle.leadingAnchor.constraint(equalTo: vwBadge.trailingAnchor, constant: 20),
            lblTitle.centerYAnchor.constraint(equalTo: vwBackground.centerYAnchor),
            lblTitle.trailingAnchor.constraint(equalTo: lblStars.leadingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            imgStar.trailingAnchor.constraint(equalTo: vwBackground.trailingAnchor, constant: -20),
            imgStar.centerYAnchor.constraint(equalTo: vwBackground.centerYAnchor),
            imgStar.heightAnchor.constraint(equalToConstant: 15),
            imgStar.widthAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            lblStars.trailingAnchor.constraint(equalTo: imgStar.leadingAnchor, constant: -10),
            lblStars.centerYAnchor.constraint(equalTo: vwBackground.centerYAnchor)
        ])
    }
}
