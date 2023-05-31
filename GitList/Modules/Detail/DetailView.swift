//
//  DetailView.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 29/05/23.
//

import UIKit
import Kingfisher

final class DetailView: UIView,
                        ViewCode,
                        UITableViewDataSource,
                        UITableViewDelegate {
    
    private var user: User!
    private var repositories: [Repository] = []
    
    private lazy var imgAvatar: UIImageView = {
        let image = UIImageView()
        image.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.AvatarImage
        image.layer.cornerRadius = 80
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var lblName: UILabel = {
        let label = UILabel()
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.NameLabel
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var vwSeparator: UIView = {
        let view = UIView()
        view.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.SeparatorView
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lblRepositories: UILabel = {
        let label = UILabel()
        label.text = Constants.Detail.Repositories
        label.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.RepositoriesLabel
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tbList: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.accessibilityIdentifier = Constants.AccessibilityIdentifier.Detail.TableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.register(RepositoryCell.self, forCellReuseIdentifier: RepositoryCell.identifier)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init(user: User!) {
        super.init(frame: .zero)
        self.user = user
        setup()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    //-----------------------------------------------------------------------
    //  MARK: - Custom Methods -
    //-----------------------------------------------------------------------
    
    func update(repositories: [Repository] = []) {
        
        self.repositories = repositories
        
        tbList.reloadData()
        
        if repositories.count == 0 {
            tbList.backgroundView = EmptyTableView()
        }
        
        if let avatar = user.avatar {
            imgAvatar.kf.setImage(with: URL(string: avatar))
        }
        
        if let userName = user.name {
            lblName.text = userName
        }
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - ViewCode Protocol -
    //-----------------------------------------------------------------------
    
    func setup() {
        backgroundColor = .black
        buildHierarchy()
        addConstraints()
    }
    
    internal func buildHierarchy() {
        addSubview(imgAvatar)
        addSubview(lblName)
        addSubview(vwSeparator)
        addSubview(lblRepositories)
        addSubview(tbList)
    }
    
    internal func addConstraints() {
        NSLayoutConstraint.activate([
            imgAvatar.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            imgAvatar.centerXAnchor.constraint(equalTo: centerXAnchor),
            imgAvatar.heightAnchor.constraint(equalToConstant: 160),
            imgAvatar.widthAnchor.constraint(equalToConstant: 160)
        ])
        
        NSLayoutConstraint.activate([
            lblName.topAnchor.constraint(equalTo: imgAvatar.bottomAnchor, constant: 15),
            lblName.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            vwSeparator.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 20),
            vwSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            vwSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            vwSeparator.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            lblRepositories.topAnchor.constraint(equalTo: vwSeparator.bottomAnchor, constant: 20),
            lblRepositories.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            tbList.topAnchor.constraint(equalTo: lblRepositories.bottomAnchor, constant: 20),
            tbList.leadingAnchor.constraint(equalTo: leadingAnchor),
            tbList.trailingAnchor.constraint(equalTo: trailingAnchor),
            tbList.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - UITableView Delegate / Datasource -
    //-----------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let repository = repositories[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryCell.identifier, for: indexPath) as! RepositoryCell
        cell.loadUI(item: repository)
        
        return cell
    }
}
