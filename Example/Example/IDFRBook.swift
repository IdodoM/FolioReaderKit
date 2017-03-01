//
//  IDFRBook.swift
//  Example
//
//  Created by Ido Meirov on 01/03/2017.
//  Copyright © 2017 FolioReader. All rights reserved.
//


import FolioReaderKit

class IDFRBook: NSObject {

    func bookTest()
    {
        let book = FRBook()
        book.resources              = FRResources()
        book.metadata               = FRMetadata()
        book.spine                  = FRSpine()
        book.smils                  = FRSmils()
        book.tableOfContents        = [FRTocReference]()
        book.flatTableOfContents    = [FRTocReference]()
        book.opfResource            = FRResource()
        book.tocResource            = FRResource()
        book.coverImage             =  FRResource()
        book.version                = Double(1)
        book.uniqueIdentifier       = ""
    }
}
