//
//  FooterCollectionReusableView.swift
//  SocialApp
//
//  Created by Даниил Сивожелезов on 16.07.2024.
//

import UIKit
import SnapKit

final class FooterCollectionReusableView: UICollectionReusableView {
    
    static let reuseId = "FooterCollectionReusableView"
    
    private lazy var footerLabel: UILabel = {
       let label = CustomLabel()
        label.configure(color: .gray, numberOfLines: 0, font: .systemFont(ofSize: 12))
        label.text = "Lorem ipsum dolor sit amet consectetur. Enim suspendisse accumsan sed augue interdum velit aliquam lobortis donec."
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(footerLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        footerLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
}
