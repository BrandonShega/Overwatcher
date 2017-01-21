//: Playground - noun: a place where people can play

import UIKit
import Kanna

let url = URL(string: "https://playoverwatch.com/en-us/career/pc/us/Smoochii-1420")!

struct Stat {
  let name: String
  let value: String
}

var stats = [String:Any]()

if let html = HTML(url: url, encoding: .utf8) {
  let playerInfo = html.at_css("#overview-section")
  let playerStatsQuickplay = html.at_css("#quickplay")
  let playerStatsCompetitive = html.at_css("#competitive")
  let playerImageURL = playerInfo?.at_css(".player-portrait")?["src"]
  let playerName = playerInfo?.at_css(".header-masthead")?.text!
  let playerLevel = playerInfo?.at_css(".player-level")
  let playerLevelImage = playerLevel?["style"]
  let playerLevelText = playerLevel?.at_css(".u-vertical-center")?.text

  let careerStats = html.at_css(".career-stats-section")
  for row in (careerStats?.css(".row"))! {
    let character = row["data-category-id"] ?? ""
    var characterStats = [String:Any]()
    print(character)
    for column in row.css(".column") {
      let title = column.at_css(".stat-title")?.text!
      for row in column.css("tbody tr") {
        var innerArray = [[String:Any]]()
        let body = row.css("td")
        let key = body[0].text!
        let value = body[1].text!
  //      print(key)
  //      print(value)
  //      let inner = [key:value]
        innerArray.append([key:value])
        characterStats[title!] = innerArray
      }
    }
    stats[character] = characterStats
  }
}

print(stats)
let valid = JSONSerialization.isValidJSONObject(stats)
