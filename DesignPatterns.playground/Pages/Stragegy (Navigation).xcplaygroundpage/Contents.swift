
protocol RouteStrategy {
    func buildRoute(from: String, destination: String) -> Route
}

struct Route: CustomStringConvertible {
    
    let title: String
    let start: String
    let destination: String
    
    let steps: [Step]
    
    var description: String {
        return steps.reduce("\(title) from \(start) to \(destination) \n\n", { current, next in
            return current + "In \(next.distance) " + (next.instruction ?? "") + "\n"
        }) + "\(destination)\n"
    }
}

struct Step {
    
    let distance: String
    let instruction: String?

    init(distance: String, instruction: String? = nil) {
        self.distance = distance
        self.instruction = instruction
    }
}

struct Navigator {
    let strategy: RouteStrategy
    func buildRoute(from start: String, to destination: String) -> Route {
        strategy.buildRoute(from: start, destination: destination)
    }
}

struct RoadStrategy: RouteStrategy {
    func buildRoute(from start: String, destination: String) -> Route {
        .init(title: "Road instructions", start: start, destination: destination, steps: [
            Step(distance: "100 meteres", instruction: "Turn right onto"),
            Step(distance: "200 meteres", instruction: "Turn left onto Reigerstraat"),
            Step(distance: "100 meteres", instruction: "Turn left onto President Kennedylaan"),
            Step(distance: "1,0 kilometres", instruction: "At the roundabout, take the third exit onto A12"),
            Step(distance: "1,7 kilometres", instruction: "Keep right towards"),
            Step(distance: "400 meteres", instruction: "Turn left onto Rivierweg towards Westervoort"),
            Step(distance: "350 meteres", instruction: "Turn left onto Nieuwgraaf"),
            Step(distance: "200 meteres", instruction: "Turn left onto Nieuwgraaf"),
            Step(distance: "40 meteres", instruction: "Turn left onto Nieuwgraaf"),
            Step(distance: "150 meteres", instruction: "Turn left onto Nieuwgraaf"),
            Step(distance: "350 meteres", instruction: "At the roundabout, take the third exit onto Nieuwgraaf"),
            Step(distance: "250 meteres", instruction: "Turn right onto Cartograaf"),
            Step(distance: "50 meteres", instruction: "The destination is on")
        ])
    }
}
struct WalkingStrategy: RouteStrategy {
    func buildRoute(from start: String, destination: String) -> Route {
        .init(title: "Walking instructions", start: "Lepelaarstraat", destination: "Mediamarkt", steps: [
            Step(distance: "25 meteres", instruction: "Bear left onto Lepelaarstraat"),
            Step(distance: "305 meteres", instruction: "Turn right onto Gruttostraat"),
            Step(distance: "160 meteres", instruction: "Turn left onto Roerdompstraat"),
            Step(distance: "385 meteres", instruction: "Turn right onto Rietganssingel"),
            Step(distance: "95 meteres", instruction: "Continue onto Lathumse Veerweg"),
            Step(distance: "85 meteres", instruction: "Turn right onto De Beemd"),
            Step(distance: "1,4 kilometres", instruction: "Walk over the bridge"),
            Step(distance: "1,0 kilometres", instruction: "Turn right onto Lathumsedijk"),
            Step(distance: "10 meteres", instruction: "Turn right"),
            Step(distance: "225 meteres", instruction: "Turn right onto Rivierweg"),
            Step(distance: "510 meteres", instruction: "Turn right onto Nieuwgraaf"),
            Step(distance: "215 meteres", instruction: "Turn right onto Nieuwgraaf"),
            Step(distance: "90 meteres", instruction: "Bear left onto Nieuwgraaf"),
            Step(distance: "20 meteres", instruction: "Turn left onto Cartograaf"),
            Step(distance: "20 meteres", instruction: "Turn left onto Cartograaf"),
            Step(distance: "30 meteres", instruction: "The destination is on"),
        ])
    }
}

let strategies: [RouteStrategy] = [
    RoadStrategy(),
    WalkingStrategy()
]

strategies.forEach {
    let start = "Lepelaarstraat"
    let destination = "Mediamarkt"
    let navigator = Navigator(strategy: $0)
    print(navigator.buildRoute(from: start, to: destination))
}
