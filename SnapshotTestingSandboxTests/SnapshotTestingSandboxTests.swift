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
}

class SnapshotTestCase: XCTestCase {
    
    public func accessibilitiesStrategy(size: CGSize? = nil,
                                          extraLargeSize: CGSize? = nil) -> [(Snapshotting<UIViewController, UIImage>, String)] {
        [
            (.image(size: size), "default"), // Default traits for ContentSizeCategory is Large
            (.image(size: size, traits: .init(preferredContentSizeCategory: .extraSmall)), "XS"),
            (.image(size: extraLargeSize ?? size, traits: .init(preferredContentSizeCategory: .accessibilityExtraExtraExtraLarge)), "accessibilityXXL")
        ]
    }
    
    public func assertSnapshots<Value, Format>(matching value: @autoclosure () throws -> Value,
                                                   as snapshotting: [(SnapshotTesting.Snapshotting<Value, Format>, String)],
                                                   named name: String? = nil,
                                                   record recording: Bool = false,
                                                   timeout: TimeInterval = 5,
                                                   file: StaticString = #file,
                                                   testName: String = #function,
                                                   line: UInt = #line) {
            try? snapshotting.forEach { strategy in
                assertSnapshot(matching: try value(),
                               as: strategy.0,
                               named: strategy.1,
                               record: recording,
                               timeout: timeout,
                               file: file,
                               testName: testName,
                               line: line)
            }
        }
    
}
