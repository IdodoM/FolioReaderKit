//
//  FRBook.swift
//  FolioReaderKit
//
//  Created by Heberti Almeida on 09/04/15.
//  Extended by Kevin Jantzer on 12/30/15
//  Copyright (c) 2015 Folio Reader. All rights reserved.
//

import UIKit

open class FRBook: NSObject {
    public var resources = FRResources()
    public var metadata = FRMetadata()
    public var spine = FRSpine()
    public var smils = FRSmils()
    public var tableOfContents: [FRTocReference]!
    public var flatTableOfContents: [FRTocReference]!
    public var opfResource: FRResource!
    public var tocResource: FRResource?
    public var coverImage: FRResource?
    public var version: Double?
    public var uniqueIdentifier: String?
    
    public func hasAudio() -> Bool {
        return smils.smils.count > 0 ? true : false
    }

    public func title() -> String? {
        return metadata.titles.first
    }

    public func authorName() -> String? {
        return metadata.creators.first?.name
    }

    // MARK: - Media Overlay Metadata
    // http://www.idpf.org/epub/301/spec/epub-mediaoverlays.html#sec-package-metadata

    public func duration() -> String? {
        return metadata.findMetaByProperty("media:duration");
    }
    
    // @NOTE: should "#" be automatically prefixed with the ID?
    public func durationFor(_ ID: String) -> String? {
        return metadata.findMetaByProperty("media:duration", refinedBy: ID)
    }
    
    
    public func activeClass() -> String {
        guard let className = metadata.findMetaByProperty("media:active-class") else {
            return "epub-media-overlay-active"
        }
        return className
    }
    
    public func playbackActiveClass() -> String {
        guard let className = metadata.findMetaByProperty("media:playback-active-class") else {
            return "epub-media-overlay-playing"
        }
        return className
    }
    
    
    // MARK: - Media Overlay (SMIL) retrieval
    
    /**
     Get Smil File from a resource (if it has a media-overlay)
    */
    public func smilFileForResource(_ resource: FRResource!) -> FRSmilFile! {
        if( resource == nil || resource.mediaOverlay == nil ){
            return nil
        }
        
        // lookup the smile resource to get info about the file
        let smilResource = resources.findById(resource.mediaOverlay)
        
        // use the resource to get the file
        return smils.findByHref( smilResource!.href )
    }
    
    public func smilFileForHref(_ href: String) -> FRSmilFile! {
        return smilFileForResource(resources.findByHref(href))
    }
    
    public func smilFileForId(_ ID: String) -> FRSmilFile! {
        return smilFileForResource(resources.findById(ID))
    }
    
}
