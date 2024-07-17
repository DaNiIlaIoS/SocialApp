//
//  MessagesViewController.swift
//  SocialApp
//
//  Created by Даниил Сивожелезов on 15.07.2024.
//

import UIKit
import SnapKit

class MessagesViewController: UIViewController {
    // MARK: - GUI Variables
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .insetGrouped)
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.reuseId)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - Properties
    private let tableData = CollectionSection.mockData().last
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        tableView.frame = view.frame
    }
    
    // MARK: - Methods
    private func setupUI() {
        view.backgroundColor = .cyan
        view.addSubview(tableView)
    }
}

extension MessagesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.reuseId, for: indexPath) as? ChatTableViewCell,
              let chat = tableData?.items[indexPath.row] else { return UITableViewCell() }
        
        cell.setupCell(chat: chat)
        return cell
    }
}

extension MessagesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
