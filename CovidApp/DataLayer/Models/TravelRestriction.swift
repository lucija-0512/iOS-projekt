import Foundation

struct TravelRestriction: Codable {

    let destination: String
    let published: String
    let summary: String
    let maskRequirements: String
    let quarantine: String
    let testTypes: String
    let beforeTiming: String
    let infoSource: String
    
    enum CodingKeys: String, CodingKey{
        case destination = "destination_name"
        case published = "published_on"
        case summary = "summary_text"
        case maskRequirements = "is_mask_required_text"
        case quarantine = "is_required_text"
        case testTypes = "accepted_types"
        case beforeTiming = "before_timing"
        case infoSource = "href"
    }
    
    
}
