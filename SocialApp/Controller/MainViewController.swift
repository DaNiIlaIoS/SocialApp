//
//  MainViewController.swift
//  SocialApp
//
//  Created by Даниил Сивожелезов on 15.07.2024.
//

import UIKit
import SnapKit

//1 delegate + viewForSupplementaryElementOfKind
//2 create header cell - UICollectionReusableView
//3 registe
//4 setup size
//5 add in section
final class MainViewController: UIViewController {
    // MARK: - GUI Variables
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .systemGray6
        
        collectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.reuseId)
        
        collectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: EventCollectionViewCell.reuseId)
        
        collectionView.register(UsersCollectionViewCell.self, forCellWithReuseIdentifier: UsersCollectionViewCell.reuseId)
        
        // Header
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.reuseId)
        
        // Footer
        collectionView.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.reuseId)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    // MARK: - Properties
    private let collectionData = CollectionSection.mockData()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        collectionView.frame = view.frame
    }
    
    // MARK: - Methods
    private func setupUI() {
        view.backgroundColor = .systemGray6
        view.addSubview(collectionView)
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch section {
            case 0: self.createNewsSection()
            case 1: self.createEventSection()
            default: self.createUsersSection()
            }
        }
    }
    
    private func createNewsSection() -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.75),
                                               heightDimension: .estimated(160))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25)
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 10, trailing: 30)
        section.boundarySupplementaryItems = [self.createHeaderSize(), self.createFooterSize()]
        
        return section
    }
    
    private func createEventSection() -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.75),
                                               heightDimension: .estimated(54))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 3)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 40, trailing: 30)
        section.boundarySupplementaryItems = [self.createHeaderSize()]
        
        return section
    }
    
    private func createUsersSection() -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(190),
                                               heightDimension: .estimated(170))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30)
        section.boundarySupplementaryItems = [self.createHeaderSize()]
        
        return section
    }
    
    private func createHeaderSize() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                 heightDimension: .absolute(50)),
              elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
    private func createFooterSize() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                 heightDimension: .absolute(50)),
              elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionData[indexPath.section].items[indexPath.row]
        
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.reuseId, for: indexPath) as? NewsCollectionViewCell else { return UICollectionViewCell() }
            cell.setupCell(item: item)
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionViewCell.reuseId, for: indexPath) as? EventCollectionViewCell else { return UICollectionViewCell() }
            cell.setupCell(item: item)
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UsersCollectionViewCell.reuseId, for: indexPath) as? UsersCollectionViewCell else { return UICollectionViewCell() }
            cell.setupCell(item: item)
            return cell
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let item = collectionData[indexPath.section]
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.reuseId, for: indexPath) as? HeaderCollectionReusableView else { return UICollectionReusableView() }
            
            switch indexPath.section {
            case 0: header.setupHeader(title: item.header, buttonImage: UIImage(systemName: "newspaper"))
            case 1: header.setupHeader(title: item.header, buttonTitle: "Подробнее")
            case 2: header.setupHeader(title: item.header, buttonTitle: "Показать всех")
            default: return header
            }
            
            header.block = {
                print(indexPath)
            }
            
            return header
        case UICollectionView.elementKindSectionFooter:
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.reuseId, for: indexPath) as? FooterCollectionReusableView else { return UICollectionReusableView() }
            return footer
        default:
            return UICollectionReusableView()
        }
    }
}
