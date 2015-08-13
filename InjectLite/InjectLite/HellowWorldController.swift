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