import Foundation
import Kanna

enum Role: String {
    case offense = "Offense"
    case defense = "Defense"
    case tank = "Tank"
    case support = "Support"
}

enum Code: String {
    case all = "0x02E00000FFFFFFFF"
    case reaper = "0x02E0000000000002"
    case tracer = "0x02E0000000000003"
    case hanzo = "0x02E0000000000005"
    case reinhardt = "0x02E0000000000007"
    case pharah = "0x02E0000000000008"
    case winston = "0x02E0000000000009"
    case widowmaker = "0x02E000000000000A"
    case symmetra = "0x02E0000000000016"
    case zenyatta = "0x02E0000000000020"
    case genji = "0x02E0000000000029"
    case roadhog = "0x02E0000000000040"
    case mccree = "0x02E0000000000042"
    case zarya = "0x02E0000000000068"
    case soldier76 = "0x02E000000000006E"
    case lucio = "0x02E0000000000079"
    case dva = "0x02E000000000007A"
    case mei = "0x02E00000000000DD"
    case ana = "0x02E000000000013B"
}

struct Hero {
    let name: String
    let role: Role
    let eliminations: Int
    let deaths: Int
    let accuracy: Int
    let blocked: Int
    let healing: Int
    let crits: Int
    let damage: Int
    let objectiveKills: Int
    let objectiveTime: Int
    let heroStats: [String:Int]
}
