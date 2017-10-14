//
//  SampleTest.swift
//  UnitTests
//
//  Created by Badarinath Venkatnarayansetty on 10/14/17.
//  Copyright © 2017 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import Nimble
import Quick

@testable import UnitTests

class Dummy{}

class WatchTest: QuickSpec{
    
    var watchInformation: [Watch] = []
    var watch : Watch!
    
    override func spec() {
        
        describe("Modal Checks"){
            
            beforeEach {
                self.watchInformation = WatchDataHelper.getWatchInformation()
                self.watch = self.watchInformation[0]
            }
            
            context("When Watch Model Data is available"){
                it("Model Type Class Validations on Watch Object "){
                    
                    //class check
                    expect(self.watch).to(beAKindOf(Watch.self))
                    expect(self.watch).toNot(beAKindOf(Dummy.self))
                    
                    //instance check
                    expect(self.watch).to(beAnInstanceOf(Watch.self))
                    expect(self.watch).toNot(beAnInstanceOf(Dummy.self))
                }
            }
            
            context("Watch Name and Brand checks"){
                var brandInformation: Brand!
                    
                beforeEach{
                    brandInformation = self.watch.brand
                }
                
                it("Watch Name and Brand validations") {
                    
                    //string and name presence check
                    expect(self.watch.name).to(beAnInstanceOf(String.self))
                    expect(self.watch.name).to(contain("Men's Business Quartz Watch CAGNARY 6828"))
                    
                    expect(brandInformation.name).to(equal("CAGARNY"))
                    expect(brandInformation.name).toNot(beNil())
                }
            }
        }
    }
}
