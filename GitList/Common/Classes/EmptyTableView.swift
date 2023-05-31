//
//  EmptyTableView.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 30/05/23.
//

import UIKit

final class EmptyTableView: UIStackView, ViewCode{
    
    private lazy var imgGit: UIImageView = {
        let image = UIImageView()
        image.accessibilityIdentifier = Constants.AccessibilityIdentifier.EmptyTableView.Image
        image.image = UIImage(named: "GithubIcon")
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var lblInfo: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.EmptyTableView.Title
        label.textColor = UIColor(named: "Gray")
        label.text = Constants.Messages.EmptyList
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    //-----------------------------------------------------------------------
    //  MARK: - ViewCode Protocol -
    //-----------------------------------------------------------------------
    
    func setup() {
        self.axis = .vertical
        self.alignment = .center
        self.distribution = .fillProportionally
        self.spacing = 10
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.alpha = 0
        
        addConstraints()
        buildHierarchy()
    }
    
    func buildHierarchy() {
        self.addArrangedSubview(imgGit)
        self.addArrangedSubview(lblInfo)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 150),
            self.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            
            self.alpha = 1
            
            if let superView = self.superview {
                NSLayoutConstraint.activate([
                    self.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
                    self.centerYAnchor.constraint(equalTo: superView.centerYAnchor, constant: -100)
                ])
            }
        }
        
        NSLayoutConstraint.activate([
            imgGit.heightAnchor.constraint(equalToConstant: 100)
        ])

        NSLayoutConstraint.activate([
            lblInfo.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
