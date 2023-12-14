//
//  MovieManager.swift
//  TableViewStoryboard
//
//  Created by yona on 12/6/23.
//

import UIKit

class MovieManager {
    var movies: [Movie]?
    
    func setMovies() {
        self.movies = [
            Movie(movieImage: UIImage(named: "batman"), movieName: "베트맨", movieDescription: "다크나이트가 근본이다."),
            Movie(movieImage: UIImage(named: "blackpanther"), movieName: "블랙팬서", movieDescription: "와칸다 포에버."),
            Movie(movieImage: UIImage(named: "captain"), movieName: "캡틴아메리카", movieDescription: "내가 왜 슈퍼히어로?"),
            Movie(movieImage: UIImage(named: "hulk"), movieName: "헐크", movieDescription: "오리지널 헐크가 근본이다."),
            Movie(movieImage: UIImage(named: "ironman"), movieName: "아이언맨", movieDescription: "아이 엠 아이언맨."),
            Movie(movieImage: UIImage(named: "spiderman"), movieName: "스파이더맨", movieDescription: "토비 맥과이어가 근본이다."),
            Movie(movieImage: UIImage(named: "spiderman2"), movieName: "스파이더맨2", movieDescription: "토비 맥과이어가 근본이다22."),
            Movie(movieImage: UIImage(named: "guardians"), movieName: "가디언스오브더갤럭시", movieDescription: "이게 왜 흥행?"),
            Movie(movieImage: UIImage(named: "thor"), movieName: "토르", movieDescription: "크림스햄은 인정."),
            Movie(movieImage: UIImage(named: "doctorstrange"), movieName: "닥터스트레인지", movieDescription: "재밌긴 한데..."),
        ]
    }
    
    func getMovies() -> [Movie] {
        return self.movies ?? []
    }
    
    func addMovie() {
        let newMovie = movies?.randomElement() ?? Movie(movieName: "", movieDescription: "")
        movies?.append(newMovie)
    }
}

