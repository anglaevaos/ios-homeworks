//
//  VKPost.swift
//  Navigation
//
//  Created by Oksana Anglaeva on 26.08.2024.
//

import UIKit

struct VKPost {
    let author: String
        let description: String
        let image: String
        let like: Int
        let view: Int
        
        static func makePost() -> [VKPost] {
            var model = [VKPost]()
            
            model.append(VKPost(author: "Криминальная Россия. Современные хроники", description: "Побег из „Крестов“. 23 февраля 1992 года из СИЗО «Кресты» в Санкт-Петербурге попытались бежать семь преступников — Перепёлкин, Шапранов, Зеленов, Королёв, Фёдоров, Зиновьев и Уткин. Когда им это не удалось, они взяли в заложники двух контролёров и стали диктовать свои условия руководству тюрьмы. ", image: "firstpost", like: 221, view: 312))
            model.append(VKPost(author: "«Следствие вели» с Леонидом Каневским", description: "Дело „Алена Делона“. В 1971 году в аэропорту города Магадана был задержан некий Магомед Цолоев, пытавшийся вывезти золотой самородок весом более 12 килограммов. В результате спецоперации были арестованы многочисленные перекупщики золота.", image: "secondpost", like: 112, view: 412))
            return model
        }
}
