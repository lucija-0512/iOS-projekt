import Foundation

struct Vaccine: Codable {

    let researcher: String
    let category: String
    let description: String
    
    enum CodingKeys: String, CodingKey{
        case researcher = "developerResearcher"
        case category = "category"
        case description = "description"
        
    }
}


