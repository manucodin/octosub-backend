import Vapor

class ServiceController {
    func getServices(request: Request) -> [ServiceDTO] {
        return []
    }
    
    func getService(request: Request) throws -> ServiceDTO {
        guard let identifier = try request.parameters.get("id", as: String.self) else { throw Abort(.badRequest) }
        
        return ServiceDTO(id: "Test", name: "Test", color: "Test", icon: "Test", category: "Test")
    }
    
    func getServicesByCategory(request: Request) throws -> [ServiceDTO]{
        guard let serviceIdentifier = try request.parameters.get("service", as: String.self) else { throw Abort(.badRequest) }
        
        return []
    }
}
