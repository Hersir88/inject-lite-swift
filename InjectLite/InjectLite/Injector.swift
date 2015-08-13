//
//  Injector.swift
//  InjectLite
//
//  Created by Uldis Baurovskis on 13/08/15.
//  Copyright (c) 2015 Uldis Baurovskis. All rights reserved.
//

import Foundation

public protocol InjectManager
{
    func addConfig(config:InjectConfig)
    func injectByID(id:String)->Injectable?
    func destroy()
}

public class Injector: InjectManager {
    
    var configs:[InjectConfig]?
    
    init ()
    {
        configs = [InjectConfig]()
    }
    
    public func addConfig(config:InjectConfig)
    {
        configs?.append(config)
        config.initConfig(self)
    }
    
    public func injectByID(id:String)->Injectable?
    {
        var item:Injectable?
        
        if let source = configs
        {
            for config in source
            {
                item = config.getInjectablebByID(id)
                
                if(item != nil)
                {
                    return item;
                }
            }
            
        }
        
        return item;
    }
    
    public func destroy()
    {
        if let source = configs
        {
            for config in source
            {
                config.destroy()
            }
        }
    }
    
}
