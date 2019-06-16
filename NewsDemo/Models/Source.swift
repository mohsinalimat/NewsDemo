

import Foundation
struct Source : Codable {
	let id : String?
	let name : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
	}


}
