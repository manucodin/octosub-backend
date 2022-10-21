import Vapor

class ServiceRouter: RouteCollection {
    private let controller = ServiceController()
    
    func boot(routes: RoutesBuilder) throws {
        let services = routes.grouped("services")
        
        services.on(.GET) { request -> [ServiceDTO] in
            self.controller.getServices(request: request)
        }
        
        services.on(.GET, ":id") { request -> ServiceDTO in
            try self.controller.getService(request: request)
        }
        
        services.on(.GET, "/category/:id") { request -> [ServiceDTO] in
            try self.controller.getServicesByCategory(request: request)
        }
    }
}
