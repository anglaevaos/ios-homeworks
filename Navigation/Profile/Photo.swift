//
//  Photo.swift
//  Navigation
//
//  Created by Oksana Anglaeva on 09.09.2024.
//

import UIKit

struct Photo {
  
  let author: String
  let image: String
 
    static func makeMockModel() -> [Photo] {
        var photo = [Photo]()
        photo.append(Photo(author: "Лавандовые поля", image: "12"))
        photo.append(Photo(author: "Котенок", image: "13"))
        photo.append(Photo(author: "Скворец", image: "14"))
        photo.append(Photo(author: "Горная река", image: "15"))
        photo.append(Photo(author: "Закат", image: "16"))
        photo.append(Photo(author: "Кит", image: "17"))
        photo.append(Photo(author: "Слоненок", image: "18"))
        photo.append(Photo(author: "Барби", image: "19"))
        photo.append(Photo(author: "Остров", image: "20"))
        photo.append(Photo(author: "Северный олень", image: "21"))
        photo.append(Photo(author: "Замок на горе", image: "22"))
        photo.append(Photo(author: "Эльбрус", image: "23"))
        photo.append(Photo(author: "Корги", image: "25"))
        photo.append(Photo(author: "Осень", image: "26"))
        photo.append(Photo(author: "Скандинавия", image: "27"))
        photo.append(Photo(author: "Пейзаж", image: "28"))
        photo.append(Photo(author: "Природа", image: "29"))
        photo.append(Photo(author: "Париж", image: "30"))
        photo.append(Photo(author: "Горы", image: "31"))
        return photo
    }
}
