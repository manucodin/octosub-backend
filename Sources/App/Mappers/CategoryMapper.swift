import Vapor

class CategoryMapper {
    static func transform(entity: Category) -> CategoryDTO? {
        guard let identifier = entity.id else { return nil }
        
        return CategoryDTO(id: identifier.hexString, name: entity.name)
    }
}
