import Foundation
import Kanna

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

extension Resource {
    init(url: URL, parseHTML: @escaping (Any) -> T) {
        self.url = url
        self.parse = { data in
            let html = HTML(html: data, encoding: .utf8)
            return html.flatMap(parseHTML)
        }
    }
}
