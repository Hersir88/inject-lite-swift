//
//  InjectConfig.swift
//  InjectLite
//
//  Created by Uldis Baurovskis on 13/08/15.
//  Copyright (c) 2015 Uldis Baurovskis. All rights reserved.
//

import Foundation

public protocol InjectConfig
{
    func addInjectable(id:String,content:Injectable)
    func getInjectablebByID(id:String)->Injectable?
    func initConfig(injector:InjectManager)
    func destroy()
}

public class InjectorConfigBase: InjectConfig
{
    private var beanList:[InjectableContainer]?
    
    init ()
    {
        beanList = [InjectableContainer]()
    }
    
    
    public func addInjectable(id:String, content:Injectable)
    {
        
        var item:InjectableContainer;
    
        if (!containsBean(id))
        {
            item = InjectableContainer(id: id, bean: content);
            beanList?.append(item);
        }
    }
    
    func containsBean(id:String)->Bool
    {
        if let source = beanList
        {
            for container in source
            {
                if container.id==id
                {
                    return true;
                }
            }
        }
        
        return false
    }
    
    public func getInjectablebByID(id: String) -> Injectable? {
        
        if let source = beanList
        {
            for container in source
            {
                if container.id==id
                {
                    return container.bean;
                }
            }
        }
        
        return nil
        
    }
    
    public func initConfig(injector:InjectManager) {
        
        if let source = beanList
        {
            for container in source
            {
                if (container.bean != nil)
                {
                    container.bean?.initInject(injector)
                }
            }
        }
    }
    
    public func destroy() {
        if let source = beanList
        {
            for container in source
            {
                container.destroy()
            }
        }
    }
    
}

