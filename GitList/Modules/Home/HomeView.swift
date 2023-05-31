//
//  HomeView.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 28/05/23.
//

import UIKit

protocol HomeViewDelegate {
    func goToDetail(user: User)
    func refreshData()
    func loadMoreData(since: Int)
}

final class HomeView: UIView,
                      ViewCode,
                      UITableViewDelegate,
                      UITableViewDataSource,
                      UISearchBarDelegate {
    
    var delegate: HomeViewDelegate!
    
    private var users: [User] = []
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.accessibilityIdentifier = Constants.AccessibilityIdentifier.Home.RefreshControl
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        refreshControl.translatesAutoresizingMaskIntoConstraints = false
        return refreshControl
    }()
    
    private lazy var tbList: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.accessibilityIdentifier = Constants.AccessibilityIdentifier.Home.TableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.register(UserCell.self, forCellReuseIdentifier: UserCell.identifier)
        tableView.separatorStyle = .singleLine
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init(delegate: HomeViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Custom Methods -
    //-----------------------------------------------------------------------
    
    func update(data: [User]) {
        users = data
        tbList.reloadData()

        if data.count == 0 {
            tbList.backgroundView = EmptyTableView()
        }
        
        refreshControl.endRefreshing()
    }
    
    @objc private func refresh() {
        self.delegate.refreshData()
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - ViewCode Protocol -
    //-----------------------------------------------------------------------
    
    internal func setup() {
        backgroundColor = .black
        buildHierarchy()
        addConstraints()
    }
    
    internal func buildHierarchy() {
        addSubview(tbList)
        tbList.addSubview(refreshControl)
    }
    
    internal func addConstraints() {
        NSLayoutConstraint.activate([
            tbList.topAnchor.constraint(equalTo: self.topAnchor),
            tbList.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tbList.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tbList.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - UITableView Delegate / Datasource -
    //-----------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let user = self.users[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.identifier,
                                                 for: indexPath) as! UserCell
        cell.loadUI(item: user)

        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        
        if let lastUser = self.users.last?.id {
            if indexPath.row == self.users.count - 5 {
                delegate.loadMoreData(since: lastUser)
            }
        }
    }

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {

        let user = self.users[indexPath.row]

        self.delegate.goToDetail(user: user)
    }
}

