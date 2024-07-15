//
//  CollectionItem.swift
//  SocialApp
//
//  Created by Даниил Сивожелезов on 15.07.2024.
//

import Foundation

struct CollectionItem: Identifiable {
    let id: String = UUID().uuidString
    let image: String
    let text: String
    var title: String? = nil
    var date: String? = nil
}
