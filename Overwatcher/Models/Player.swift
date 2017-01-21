import Foundation
import Kanna

struct Player {
    let username: String
	let avatarImageURL: String?
	let upperLevelImageURL: String?
	let lowerLevelImageURL: String?
//	let rankImageURL: String
	let playerLevel: String
//	let playerRank: String
//    let competitiveStats: PlayerStats
//    let quickplayStats: PlayerStats
}

extension Player {
    init(html: HTMLDocument) {
        let playerInfo = html.at_css("#overview-section")
        self.username = playerInfo?.at_css(".header-masthead")?.text ?? ""
		self.avatarImageURL = playerInfo?.at_css(".player-portrait")?["src"] ?? ""
		let playerLevelDiv = playerInfo?.at_css(".player-level")
		self.playerLevel = playerLevelDiv?.at_css(".u-vertical-center")?.text ?? ""
		let playerLevelUpperBackground = playerLevelDiv?["style"] ?? ""
		let playerLevelLowerBackground = playerLevelDiv?.at_css(".player-rank")?["style"] ?? ""
		if let upperMatch = playerLevelUpperBackground.range(of: "\\(([^)]+)\\)", options: .regularExpression, range: nil, locale: nil) {
			self.upperLevelImageURL = String(playerLevelUpperBackground.substring(with: upperMatch).characters.dropFirst().dropLast())
		} else {
			self.upperLevelImageURL = nil
		}
		if let lowerMatch = playerLevelLowerBackground.range(of: "\\(([^)]+)\\)", options: .regularExpression, range: nil, locale: nil) {
			self.lowerLevelImageURL = String(playerLevelLowerBackground.substring(with: lowerMatch).characters.dropFirst().dropLast())
		} else {
			self.lowerLevelImageURL = nil
		}
//		print(playerLevelUpperBackground.characters.split(separator: "(", maxSplits: 1, omittingEmptySubsequences: true))
//		print(playerLevelLowerBackground)
    }
}
