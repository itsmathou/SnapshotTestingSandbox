//
//  SnapshotTestingSandboxTests.swift
//  SnapshotTestingSandboxTests
//
//  Created by Mathilde Ferrand on 10/07/2020.
//

import XCTest
import SnapshotTesting

@testable import SnapshotTestingSandbox

class SnapshotTestingSandboxTests: SnapshotTestCase {
    
    var subject: ViewController!
    
    override func setUp() {
        super.setUp()
        subject = ViewController()
    }
    
    override func tearDown() {
        super.tearDown()
        subject = nil
    }
    
    func test_subjectWithFontDynamicFontType() {
        assertSnapshots(matching: subject, as: accessibilitiesStrategy())
    }
    
    func test_subjectWithDifferentScreenSizes() {
        assertSnapshots(matching: subject, as: screenStrategy)
    }
}
