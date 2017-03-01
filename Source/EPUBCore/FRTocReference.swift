//
//  FRTocReference.swift
//  FolioReaderKit
//
//  Created by Heberti Almeida on 06/05/15.
//  Copyright (c) 2015 Folio Reader. All rights reserved.
//

import UIKit

public class FRTocReference: NSObject {
    public var resource: FRResource?
    public var title: String!
    public var fragmentID: String?
    public var children: [FRTocReference]!
    
    public convenience init(title: String, resource: FRResource?, fragmentID: String = "") {
        self.init(title: title, resource: resource, fragmentID: fragmentID, children: [FRTocReference]())
    }
    
    public init(title: String, resource: FRResource?, fragmentID: String, children: [FRTocReference]) {
        self.resource = resource
        self.title = title
        self.fragmentID = fragmentID
        self.children = children
    }
}

// MARK: Equatable

public func ==(lhs: FRTocReference, rhs: FRTocReference) -> Bool {
    return lhs.title == rhs.title && lhs.fragmentID == rhs.fragmentID
}
