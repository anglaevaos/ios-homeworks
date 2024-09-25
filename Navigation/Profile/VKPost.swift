
public struct VKPost {
    public var author: String
    public var description: String
    public var image: String
    public var like: Int
    public var view: Int
        
    public static func makePost() -> [VKPost] {
            var model = [VKPost]()
            
            model.append(VKPost(author: "Криминальная Россия. Современные хроники", description: "Побег из „Крестов“. 23 февраля 1992 года из СИЗО «Кресты» в Санкт-Петербурге попытались бежать семь преступников — Перепёлкин, Шапранов, Зеленов, Королёв, Фёдоров, Зиновьев и Уткин.", image: "firstpost", like: 221, view: 312))
            model.append(VKPost(author: "Grazia", description: "Ба́рби (англ. Barbie, уменьш. от Barbara [Барбара]) — детская игрушка, кукла, преимущественно для девочек в возрасте от 3 до 14 лет. Выпущена американской компанией Mattel в 1959 году в США — штате Висконсин.", image: "barbie", like: 272, view: 766))
            model.append(VKPost(author: "«Следствие вели» с Леонидом Каневским", description: "Дело „Алена Делона“. В 1971 году в аэропорту города Магадана был задержан некий Магомед Цолоев, пытавшийся вывезти золотой самородок весом более 12 килограммов", image: "secondpost", like: 112, view: 412))
            model.append(VKPost(author: " Г О С У Д А Р С Т В Е Н Н Ы Й   С Т А Н Д А Р Т   С О Ю З А   С С Р", description: "ДГОСТ 19.201-78 Техническое задание.", image: "tech", like: 100542200012, view: 41222))
           
            return model
        }
}
