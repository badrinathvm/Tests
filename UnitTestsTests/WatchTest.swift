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

    override func spec() {
        
        var watchInformation: [Watch]!
        var watch : Watch!
        
        describe("Modal Checks"){
            
            beforeEach {
                watchInformation = WatchDataHelper.getWatchInformation()
                watch = watchInformation[0]
                //watch = Watch(name: "Men's Business Quartz Watch CAGARNY 6828", price: 11.69, brand: Brand(id: 6828, name: "CAGARNY"))
            }
            
            context("When Watch Model Data is available"){
                it("Model Type Class Validations on Watch Object "){
                    
                    //class check
                    expect(watch).to(beAKindOf(Watch.self))
                    expect(watch).toNot(beAKindOf(Dummy.self))
                    
                    //instance check
                    expect(watch).to(beAnInstanceOf(Watch.self))
                    expect(watch).toNot(beAnInstanceOf(Dummy.self))
                }
            }
            
            context("Watch Name and Brand checks"){
                var brandInformation: Brand!
                    
                beforeEach{
                    brandInformation = watch.brand
                }
                
                it("Watch Name and Brand validations") {
                    
                    //string and name presence check
                    expect(watch.name).to(beAnInstanceOf(String.self))
                    expect(watch.name).to(contain("Men's Business Quartz Watch CAGARNY"))
                    expect(watch.name).to(endWith("CAGARNY 6828"))
                    
                    expect(brandInformation.name).to(equal("CAGARNY"))
                    expect(brandInformation.name).to(beginWith("CAG"))
                    expect(brandInformation.name).toNot(beNil())
                }
                
                it("Watch Price validations"){
                  
                    expect(watch.price).toNot(beNil())
                    expect(watch.price).to(beTruthy())
                    
                    //evaluating boundary cases
                    expect(watch.price).toNot(beLessThan(0))
                    expect(watch.price).to(beCloseTo(11, within: 0.69))
                    expect(watch.price).to(beLessThanOrEqualTo(11.69))
                    expect(watch.price).to(beGreaterThan(Double.pi))
                    
                    expect(watch.price).toNot(beGreaterThan(11.69))
                    expect(watch.price).toNot(beGreaterThan(Double.infinity))
                    expect(watch.price).toNot(be(Double.signalingNaN))
                    expect(watch.price).toNot(be(Double.nan))
                
                }
            }
        }
    }
}
