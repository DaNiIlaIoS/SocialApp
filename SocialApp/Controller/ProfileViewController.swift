//
//  ProfileViewController.swift
//  SocialApp
//
//  Created by Даниил Сивожелезов on 15.07.2024.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    // MARK: - GUI Variables
    
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Methods
    private func setupUI() {
        view.backgroundColor = .cyan
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
    }

}
