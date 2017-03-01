//
//  FRSpine.swift
//  FolioReaderKit
//
//  Created by Heberti Almeida on 06/05/15.
//  Copyright (c) 2015 Folio Reader. All rights reserved.
//

import UIKit

public struct Spine {
    public var linear: Bool!
    public var resource: FRResource!
    
    public init(resource: FRResource, linear: Bool = true) {
        self.resource = resource
        self.linear = linear
    }
}

public class FRSpine: NSObject {
    public var pageProgressionDirection: String?
    public var spineReferences = [Spine]()
    public var isRtl: Bool {
        if let pageProgressionDirection = pageProgressionDirection , pageProgressionDirection == "rtl" {
            return true
        }
        return false
    }

    public func nextChapter(_ href: String) -> FRResource? {
        var found = false;

        for item in spineReferences {
            if(found){
                return item.resource
            }

            if(item.resource.href == href) {
                found = true
            }
        }
        return nil
    }
}
