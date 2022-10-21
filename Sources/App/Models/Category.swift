import Vapor
import Fluent
import MongoKitten

class Category: Model {
    static let schema = "categories"
    
    @ID(custom:.id)
    var id: ObjectId?
    
    @Field(key: "name")
    var name: String
    
    required init() {}
    
    init(id: ObjectId? = nil, name: String) {
        self.id = id
        self.name = name
    }
}


