//
//  CollectionSection.swift
//  SocialApp
//
//  Created by Даниил Сивожелезов on 15.07.2024.
//

import Foundation

struct CollectionSection: Identifiable {
    let id: String = UUID().uuidString
    let header: String
    let items: [CollectionItem]
    
    static func mockData() -> [CollectionSection] {
        
        let newsItems = [CollectionItem(image: "news1", text: "Lorem ipsum dolor sit amet consectetur", title: "Comic con в Астане", date: Date().formateDate()),
                         CollectionItem(image: "news2", text: "Lorem ipsum dolor sit amet consectetur", title: "Выход фильма Дэдпул 3", date: Date().formateDate()),
                         CollectionItem(image: "news3", text: "Lorem ipsum dolor sit amet consectetur", title: "Есть ли жизнь на марсе?", date: Date().formateDate()),
                         CollectionItem(image: "news4", text: "Lorem ipsum dolor sit amet consectetur", title: "EURO 2024", date: Date().formateDate())]
        
        let eventsItems = [CollectionItem(image: "event1", text: "Текст в одну строку, если ..."),
                           CollectionItem(image: "event2", text: "Текст в одну строку, если ..."),
                           CollectionItem(image: "event3", text: "Текст в одну строку, если ..."),
                           CollectionItem(image: "event4", text: "Текст в одну строку, если ..."),
                           CollectionItem(image: "event5", text: "Текст в одну строку, если ..."),
                           CollectionItem(image: "event6", text: "Текст в одну строку, если ...")]
        
        let userItems = [CollectionItem(image: "person1", text: "Lorem ipsum dolor sit amet consectetur.", title: "User Name 1"),
                         CollectionItem(image: "person2", text: "Lorem ipsum dolor sit amet consectetur.", title: "User Name 2"),
                         CollectionItem(image: "person3", text: "Lorem ipsum dolor sit amet consectetur.", title: "User Name 3"),
                         CollectionItem(image: "person4", text: "Lorem ipsum dolor sit amet consectetur.", title: "User Name 4"),
                         CollectionItem(image: "person5", text: "Lorem ipsum dolor sit amet consectetur.", title: "User Name 5"),]
        
        let newsSection = CollectionSection(header: "Новости", items: newsItems)
        let eventsSection = CollectionSection(header: "События", items: eventsItems)
        let userSection = CollectionSection(header: "Пользователи", items: userItems)
        
        return [newsSection, eventsSection, userSection]
    }
}
