import Foundation
import Kanna

enum Section: String {
    case heroSpecific = "Hero Specific"
    case best = "Best"
    case deaths = "Deaths"
    case game = "Game"
    case combat = "Combat"
    case assists = "Assists"
    case average = "Average"
    case matchAwards = "Match Awards"
    case miscellaneous = "Miscellaneous"
}

struct PlayerStats {
    let gamesWon: Int
    let gamesLost: Int
    let gamesTied: Int
    let timePlayed: Int
    let eliminations: Int
    let deaths: Int
    let damageDone: Int
    let soloKills: Int
    let objectiveKills: Int
    let finalBlows: Int
}

extension PlayerStats {
//    init?(html: XMLElement) {
//        for node in html.css(".column") {
//            guard let title = node.at_css(".stat-title")?.text else { return nil }
//            switch Section(rawValue: title) {
//            case .combat:
//            default:
//
//            }
//        }
//    }
}
