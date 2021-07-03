import Foundation

struct WorldNews: Codable {
    let newsId: String
    let title: String
    let link : String
    let imageURL: String
    //let imageInLocalStorage : String
    //let imageFileName: String
    let pubDate: String
    let content : String
    //let reference : String
    
    enum CodingKeys: String, CodingKey {
        case newsId = "news_id"
        case title = "title"
        case link = "link"
        case imageURL = "urlToImage"
        //case imageInLocalStorage = "imageInLocalStorage"
        //case imageFileName = "imageFileName"
        case pubDate = "pubDate"
        case content = "content"
        //case reference = "reference"
    }
}
