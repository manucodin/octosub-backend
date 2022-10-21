import Vapor

class CategoryRouter: RouteCollection {
    private let controller = CategoryController()
    
    func boot(routes: RoutesBuilder) throws {
        let categories = routes.grouped("categories")
        
        categories.on(.GET) { request -> [CategoryDTO] in
            try await self.controller.getCategories(request: request)
        }
        
        categories.on(.GET, ":id") { request -> CategoryDTO in
            try await self.controller.getCategory(request: request)
        }
    }
}
