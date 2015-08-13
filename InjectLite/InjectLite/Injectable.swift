//
//  Injectable.swift
//  InjectLite
//
//  Created by Uldis Baurovskis on 13/08/15.
//  Copyright (c) 2015 Uldis Baurovskis. All rights reserved.
//

import Foundation

public protocol Injectable
{
     func initInject(injector:InjectManager)
     func destroy()
}
