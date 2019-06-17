//
//  MockupsNewsListRepository.swift
//  NewsDemo
//
//  Created by Ali Adam on 6/17/19.
//  Copyright © 2019 AliAdam. All rights reserved.
//

import Foundation
import Alamofire

///get mockup liat and inject it into viewmodel for unit testing
class MockupsNewsListRepository: NewsListRepository {
  
    
    let json = [
        "status": "ok",
        "totalResults": 38,
        "articles": [
            [
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
            ],
            [
                "source": [
                    "id": "",
                    "name": "Bbc.com"
                ],
                "author": "https://www.facebook.com/bbcnews",
                "title": "North Carolina suspect fought off by boy with machete due in court - BBC News",
                "description": "One of the suspects was arrested two days after fleeing a hospital with a head injury.",
                "url": "https://www.bbc.com/news/world-us-canada-48667171",
                "urlToImage": "https://ichef.bbci.co.uk/news/1024/branded_news/17E09/production/_107410879_be17675d-d3c3-4876-beba-a19912365478.jpg",
                "publishedAt": "2019-06-17T15:49:37Z",
                "content": "Image copyrightOrange County Sheriff's OfficeImage caption\r\n Jataveon Dashawn Hall was arrested two days after escaping from a hospital\r\nA suspected burglar who was fought off by an 11-year-old boy with a machete in the US state of North Carolina is due to ap… [+2462 chars]"
            ],
            [
                "source": [
                    "id": "cnn",
                    "name": "CNN"
                ],
                "author": "Eliott C. McLaughlin, CNN",
                "title": "Fashion icon and artist Gloria Vanderbilt dies at 95 - CNN",
                "description": "Gloria Vanderbilt died Monday morning, according to her son, CNN's Anderson Cooper. The fashion designer, artist and socialite was 95.",
                "url": "https://www.cnn.com/2019/06/17/entertainment/gloria-vanderbilt-dies/index.html",
                "urlToImage": "https://cdn.cnn.com/cnnnext/dam/assets/141008174215-14-roots-anderson-cooper-1008-super-tease.jpg",
                "publishedAt": "2019-06-17T15:25:00Z",
                "content": "(CNN)Gloria Vanderbilt died Monday morning, according to her son, CNN's Anderson Cooper. The fashion designer, artist and socialite was 95. \r\nShe died at home with friends and family at her side.\r\n\"Gloria Vanderbilt was an extraordinary woman, who loved life,… [+5385 chars]"
            ],
            [
                "source": [
                    "id": "cnn",
                    "name": "CNN"
                ],
                "author": "Matt Egan, CNN Business",
                "title": "Sotheby's sold to billionaire art collector Patrick Drahi for $3.7 billion - CNN",
                "description": "Telecom billionaire and art collector Patrick Drahi has emerged as the winning bidder for Sotheby's, the 275-year-old auction house.",
                "url": "https://www.cnn.com/2019/06/17/investing/sothebys-sale-patrick-drahi/index.html",
                "urlToImage": "https://cdn.cnn.com/cnnnext/dam/assets/190617091733-sothebys-sale-super-tease.jpg",
                "publishedAt": "2019-06-17T15:23:00Z",
                "content": ""
            ]
        ]
        ] as [String : Any]
    
    func getNewsList(with parameters: Parameters, completionHandler: @escaping (Response<[Article]>) -> ()) {
        let decoder = JSONDecoder()
        let jsonData = try? JSONSerialization.data(withJSONObject:json)
        let newsList = try? decoder.decode(NewsList.self, from: jsonData!)
        completionHandler(.success((newsList?.articles!)!))
        
    }
}
