import Foundation
import Kanna

final class HTMLParser {

    var url: URL

    init(url: URL) {
        self.url = url
    }

    func parse(completion: (HTMLDocument) -> ()) {
        if let html = HTML(url: url, encoding: .utf8) {
            completion(html)
        }
    }
}
