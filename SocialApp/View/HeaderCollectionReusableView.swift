//
//  HeaderCollectionReusableView.swift
//  SocialApp
//
//  Created by Даниил Сивожелезов on 15.07.2024.
//

import UIKit
import SnapKit

final class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let reuseId = "HeaderCollectionReusableView"
    var block: ( () -> Void )?
    
    private lazy var headerLabel: UILabel = {
        let label = CustomLabel()
        label.configure(color: .black, numberOfLines: 1, font: .systemFont(ofSize: 20, weight: .black))
        return label
    }()
    
    lazy var headerButton: UIButton = {
        let button = UIButton(primaryAction: UIAction(handler: { [weak self] _ in
            self?.block?()
        }))
        button.setTitleColor(.systemBlue, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var headerStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.addArrangedSubview(headerLabel)
        stack.addArrangedSubview(headerButton)
        return stack
    }()
    
    func setupHeader(title: String, buttonTitle: String? = nil , buttonImage: UIImage? = nil) {
        headerLabel.text = title
        headerButton.setTitle(buttonTitle, for: .normal)
        headerButton.setImage(buttonImage, for: .normal)
        
        addSubview(headerStackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        headerStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
    }
}
