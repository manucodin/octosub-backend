import Vapor
import Fluent

class Service: Model {
    static let schema = "services"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "color")
    var color: String
    
    @Field(key: "icon")
    var icon: String
    
    @Parent(key: "category")
    var category: Category
    
    required init() { }
    
    init(id: UUID? = nil, name: String, color: String, icon: String, category: Category) {
        self.id = id
        self.name = name
        self.color = color
        self.icon = icon
        self.category = category
    }
}
