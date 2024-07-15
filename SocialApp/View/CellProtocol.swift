//
//  CellProtocol.swift
//  SocialApp
//
//  Created by Даниил Сивожелезов on 15.07.2024.
//

import UIKit

protocol CellProtocol: AnyObject {
    static var reuseId: String { get }
    var imageView: UIImageView { get set }
    func setupCell(item: CollectionItem)
}
