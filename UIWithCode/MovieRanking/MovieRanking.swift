//
//  MovieRanking.swift
//  UIWithCode
//
//  Created by 박준우 on 1/14/25.
//

import Foundation

struct MovieRanking {
    var rank: Int
    var title: String
    var date: String
    
    static let mockData: [MovieRanking] = [
        .init(rank: 1, title: "엽문4", date: "2020-04-01"),
        .init(rank: 2, title: "주디", date: "2020-03-25"),
        .init(rank: 3, title: "1917", date: "2020-02-19"),
        .init(rank: 4, title: "인비저블맨", date: "2020-02-26"),
        .init(rank: 5, title: "n번째 이별 중", date: "2020-04-01"),
        .init(rank: 6, title: "스케어리 스토리", date: "2020-03-25"),
        .init(rank: 7, title: "날씨의 아이", date: "2019-10-30"),
        .init(rank: 8, title: "라라랜드", date: "2016-12-07"),
        .init(rank: 9, title: "너의 이름은", date: "2017-01-04"),
        .init(rank: 10, title: "다크 워터스", date: "2020-03-11"),
    ]
}
