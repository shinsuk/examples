//
//  ContentView.swift
//  NSOperationTest
//
//  Created by Linus on 20210407.
//

import SwiftUI
import Foundation

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear(perform: {
                let operationQueue = OperationQueue()
                operationQueue.maxConcurrentOperationCount = 1

                let blockOperation1 = BlockOperation {
                    print(1)
                }

                let blockOperation2 = BlockOperation {
                    print(2)
                }

                let blockOperation3 = BlockOperation {
                    print(3)
                }

                blockOperation1.addDependency(blockOperation2)
                blockOperation2.addDependency(blockOperation3)

                operationQueue.addOperation(blockOperation1)
                operationQueue.addOperation(blockOperation2)
                operationQueue.addOperation(blockOperation3)

//                operationQueue.waitUntilAllOperationsAreFinished()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
