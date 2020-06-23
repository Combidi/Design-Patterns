
struct Engine {
    let horsePower: Int
}

struct Wheels {
    let diameter: Int
    let description: String
}

protocol CarBuilder {
    func makeSportEngine() -> Engine
    func makeColor() -> String
    func makeWheels() -> String
}

struct Car {
    let name: String
    let engine: Engine
    let color: String
}

struct SportsCarBuilder: CarBuilder {
    func makeSportEngine() -> Engine {
        <#code#>
    }
    
    func makeColor() -> String {
        <#code#>
    }
    
    func makeWheels() -> String {
        <#code#>
    }
    
    
}

struct SimpleCarBuilder: CarBuilder {
    func makeSportEngine() -> Engine {
        <#code#>
    }
    
    func makeColor() -> String {
        <#code#>
    }
    
    func makeWheels() -> String {
        <#code#>
    }
    
    
}

struct Director {
    
    func makeCar(ofType carType: CarType, using builder: CarBuilder) -> Car {
        switch carType {
        case .fancy:
            return .init(
                name: "Mercedes-Benz S-Class",
                engine: builder.makeSportEngine(),
                color: builder.makeColor()
            )
        case .simple:
            return .init(
                name: "Fiat Panda",
                engine: builder.makeSimpleEngine(),
                color: builder.makeColor()
            )
        }
    }
}

