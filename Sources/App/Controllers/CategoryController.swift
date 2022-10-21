import Vapor
import MongoKitten

class CategoryController {
    func getCategories(request: Request) async throws -> [CategoryDTO] {
        do {
            let categoriesEntities = try await Category.query(on: request.db).all()
            return categoriesEntities.map(CategoryMapper.transform).compactMap{ $0 }
        } catch {
            throw Abort(.badRequest)
        }
    }
    
    func getCategory(request: Request) async throws -> CategoryDTO {
        guard let identifier  = request.parameters.get("id", as: String.self) else { throw Abort(.badRequest) }
        guard let categoryEntity = try await Category.find(ObjectId(identifier), on: request.db) else { throw Abort(.badRequest) }
        guard let category = CategoryMapper.transform(entity: categoryEntity) else { throw Abort(.badRequest) }
        
        return category
    }
}
