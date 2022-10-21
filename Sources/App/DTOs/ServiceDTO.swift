import Vapor

struct ServiceDTO: Content {
    let id: String
    let name: String
    let color: String
    let icon: String
    let category: String
}
