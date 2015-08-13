# Inject lite for Swift
It is lite dependency management library.

## How to use
First step is to create some injectable element that you want to share in your application. For example I will use MVC pattern and inject controller for Hello World application.

### MODEL
Type is '**Injectable'**. This protocol defines 2 methods.

**initInject**: It is used to inject dependencies
**destroy**: to clean all resources

Code for our model:
```
public class HelloWorldModel:Injectable {
    public var message:String = "Hello World"
    public func initInject(injector:InjectManager){}
    public func destroy(){}
}
```

### CONTROLLER
Type is '**Injectable'**.
Elements are injected using id's that are assigned in config

Code for our Controller
```
public class HelloWorldController:Injectable {
    var model:HelloWorldModel?
    
    public func getMessage()->String
    {
        if model != nil
        {
            return model!.message;
        }
        
        return "";
    }
    
    public func initInject(injector:InjectManager)
    {
        model = injector.injectByID("HelloWorldModel") as? HelloWorldModel
    }
    
    public func destroy()
    {
        if model != nil
        {
            model?.destroy()
            model=nil
        }
    }
}
```
### Inject Config

Config is used as container to hold all Injectable elements. You can add as many configs as you will, just element id's need to be unique.

To make Config just extend class **'InjectorConfigBase'** and add your elements there.
Code:
```
public class HelloWorldConfig:InjectorConfigBase {
    
    override init() {
        super.init()
        addInjectable("HelloWorldModel", content: HelloWorldModel())
        addInjectable("HelloWorldController", content: HelloWorldController())
    }
    
}
```

Id's of elements you can save in struct to easer inject process later.

### Injector
Finally we can init our Injector
Code:
```
var injector = Injector()
    injector.addConfig(HelloWorldConfig())
```

To inject element just use **'injectByID'**
```
var controller = injector.injectByID("HelloWorldController") as? HelloWorldController
```

To share injector in your app you can use AppDelegat or **'Service locator pattern'**, thats basically is modified Singleton pattern. You need to create class with static variable and add your injector there.