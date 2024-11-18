import Foundation

// https://openlibrary.org/books/OL7353617M.json

struct Endpoint {
    private var scheme: String?
    private var host: String?
    private var path: String
}

extension Endpoint {
    var url: URL? {
        // TODO: URL builder goes here
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path

        return components.url
    }
}

extension Endpoint {
    static var misterFox: Self {
        Endpoint(scheme: "https", host: "openlibrary.org", path: "/books/OL7353617M.json")
    }
}
