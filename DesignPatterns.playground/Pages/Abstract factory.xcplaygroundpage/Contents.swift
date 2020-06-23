
protocol Phone: CustomStringConvertible {
    func makeCall(number: String)
}

protocol Tablet: CustomStringConvertible {
    func openApp()
}

protocol DeviceFactory: CustomStringConvertible {
    func makePhone() -> Phone
    func makeTablet() -> Tablet
}


struct iPhone: Phone {
    func makeCall(number: String) {}
    let description = "Fancy iPad"
}

struct iPad: Tablet {
    func openApp() {}
    let description = "Fancy iPad Pro"
}

struct Lumia: Phone {
    func makeCall(number: String) {}
    let description = "Microsoft Lumia 640"
}

struct Surface: Tablet {
    func openApp() {}
    let description = "Surface Pro X"
}


struct AppleFactory: DeviceFactory {
    
    let description = "Apple factory"
    
    func makePhone() -> Phone {
        iPhone()
    }
    func makeTablet() -> Tablet {
        iPad()
    }
}

struct MicrosoftFactory: DeviceFactory {
    
    let description = "Microsoft factory"
    
    func makePhone() -> Phone {
        Lumia()
    }
    
    func makeTablet() -> Tablet {
        Surface()
    }
}


struct Client {
    
    let factory: DeviceFactory

    func printDevices() {
        print(
        """
        Available devices from the \(factory):
        Phone: \(factory.makePhone())
        Tablet: \(factory.makeTablet())
            
        """
        )
    }
}

let appleClient = Client(factory: AppleFactory())
appleClient.printDevices()

let microsoftClient = Client(factory: MicrosoftFactory())
microsoftClient.printDevices()
