

import Foundation
struct NewsList : Codable {
	let status : String?
    let message : String?
    let code : String?
    let totalResults : Int?
	let articles : [Article]?
	enum CodingKeys: String, CodingKey {
		case status = "status"
        case code = "code"
        case message = "message"
		case totalResults = "totalResults"
		case articles = "articles"
	}
}
