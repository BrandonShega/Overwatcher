import Foundation
import UIKit

class PlayerViewController: UIViewController {

    @IBOutlet private weak var playerNameLabel: UILabel!

    private var player: Player?

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://playoverwatch.com/en-us/career/pc/us/Smoochii-1420")!
        let htmlParser = HTMLParser(url: url)
        htmlParser.parse() { html in
            print(html)
            player = Player(html: html)
            playerNameLabel.text = player?.username

          var stats = [String:Any]()

          let careerStats = html.at_css(".career-stats-section")
          for node in (careerStats?.css(".column"))! {
            let title = node.at_css(".stat-title")?.text!
            var innerArray = [[String:Any]]()
            for row in node.css("tbody tr") {
              let body = row.css("td")
              let key = body[0].text!
              let value = body[1].text!
              //      print(key)
              //      print(value)
              let inner = [key:value]
              innerArray.append(inner)
              stats[title!] = innerArray
            }
          }

          print(stats)

        }
    }

}
