//
//  InjectableContainer.swift
//  InjectLite
//
//  Created by Uldis Baurovskis on 13/08/15.
//  Copyright (c) 2015 Uldis Baurovskis. All rights reserved.
//

import Foundation

public class InjectableContainer {
    
    public var id:String?
    public var bean:Injectable?
    
    init (id:String,bean:Injectable)
    {
        self.id=id
        self.bean=bean
    }
    
    public func destroy()
    {
        if let content = bean
        {
            content.destroy()
        }
        self.bean=nil
    }
    
}
