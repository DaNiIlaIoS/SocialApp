//
//  ProfileViewController.swift
//  SocialApp
//
//  Created by Даниил Сивожелезов on 15.07.2024.
//

import UIKit
import WebKit

class ProfileViewController: UIViewController {
    // MARK: - GUI Variables
    private lazy var webView: WKWebView = WKWebView(frame: view.frame)
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
       let indicator = UIActivityIndicatorView()
        
        indicator.frame.origin.x = view.center.x
        indicator.frame.origin.y = view.center.y
        
        indicator.hidesWhenStopped = true
        indicator.style = .large
        indicator.startAnimating()
        
        return indicator
    }()
    
    // MARK: - Properties
    let url = URL(string: "https://vk.com/daniil_sivozhelezov")
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        setupUI()
    }
    
    // MARK: - Methods
    private func setupUI() {
        view.addSubview(webView)
        view.addSubview(activityIndicator)
        
        createRequest()
    }
    
    private func createRequest() {
        if let url = url {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}

extension ProfileViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("didFinish")
        activityIndicator.stopAnimating()
    }
}
