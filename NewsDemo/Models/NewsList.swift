

import Foundation
struct NewsList : Codable {
	let status : String?
	let totalResults : Int?
	let articles : [Article]?

	enum CodingKeys: String, CodingKey {

		case status = "status"
		case totalResults = "totalResults"
		case articles = "articles"
	}
}
