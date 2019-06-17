//
//  MockupsArticale.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/17/19.
//  Copyright © 2019 AliAdam. All rights reserved.
//

import Foundation
class MockupArticle {


    class func getArticle() -> Article {
        let json = [
            "source": [
                "id": "cnn",
                "name": "CNN"
            ],
            "author": "Kara Fox, CNN",
            "title": "Mohamed Morsy, ousted Egyptian president, dies in court - CNN",
            "description": "Ousted Egyptian President Mohamed Morsy, who was the country's first democratically elected leader, has died, according to Egyptian state media.",
            "url": "https://www.cnn.com/2019/06/17/middleeast/mohamed-morsy-dies-egypt-intl/index.html",
            "urlToImage": "https://cdn.cnn.com/cnnnext/dam/assets/190617170743-01-mohamed-morsy-lead-super-tease.jpg",
            "publishedAt": "2019-06-17T16:23:00Z",
            "content": "(CNN)Ousted Egyptian President Mohamed Morsy, who was the country's first democratically elected leader, has died, according to Egyptian state media.\r\nMorsy, 67, had been on trial for an espionage case when he suffered a heart attack, Egypt's state-run Al Ahr… [+2201 chars]"
            ]
            as [String : Any]
        let decoder = JSONDecoder()
        let jsonData = try? JSONSerialization.data(withJSONObject:json)
        let article = (try? decoder.decode(Article.self, from: jsonData!))!
        return article

    }
}
