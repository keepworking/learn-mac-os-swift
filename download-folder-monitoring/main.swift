//
//  main.swift
//  MyProduct0002
//
//  Created by keepwokring on 2022/10/20.
//

import Foundation
import System
import Dispatch

// get file desc
let fdesc = try FileDescriptor.open(NSHomeDirectory() + "/Downloads", .readOnly, options: .eventOnly)

print(fdesc)


// get dispatch
let source = DispatchSource.makeFileSystemObjectSource(fileDescriptor: fdesc.rawValue, eventMask: .all, queue: .global())

source.setEventHandler {
    let event = source.data
    print("file event : ", event)
}

source.resume()


// quit process with any key
getchar()

