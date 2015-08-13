class HelloWorldConfig:InjectorConfigBase {
    
    override init() {
        super.init()
        addInjectable("HelloWorldModel", content: HelloWorldModel())
        addInjectable("HelloWorldController", content: HelloWorldController())
        
    }
    
}

