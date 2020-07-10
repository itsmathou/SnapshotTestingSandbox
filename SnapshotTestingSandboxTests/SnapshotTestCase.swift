//
//  SnapshotTestCase.swift
//  SnapshotTestingSandboxTests
//
//  Created by Mathilde Ferrand on 10/07/2020.
//

import XCTest
import SnapshotTesting

class SnapshotTestCase: XCTestCase {
    
    var screenStrategy: [(Snapshotting<UIViewController, UIImage>, String)] {
            return [(.image(on: .iPhone8), "iPhone8_default"),
                    (.image(on: .iPhone8, traits: .init(preferredContentSizeCategory: .extraSmall)), "iPhone8_XS"),
                    (.image(on: .iPhone8, traits: .init(preferredContentSizeCategory: .accessibilityExtraExtraExtraLarge)), "iPhone8_accessibilityXXL"),
                    (.image(on: .iPhoneSe), "iPhoneSe_default"),
                    (.image(on: .iPhoneXsMax), "iPhoneXSMax_default")
            ]
        }
    
    func accessibilitiesStrategy(size: CGSize? = nil,
                                        extraLargeSize: CGSize? = nil) -> [(Snapshotting<UIViewController, UIImage>, String)] {
        [
            (.image(size: size), "default"), // Default traits for ContentSizeCategory is Large
            (.image(size: size, traits: .init(preferredContentSizeCategory: .extraSmall)), "XS"),
            (.image(size: extraLargeSize ?? size, traits: .init(preferredContentSizeCategory: .accessibilityExtraExtraExtraLarge)), "accessibilityXXL")
        ]
    }
    
    func assertSnapshots<Value, Format>(matching value: @autoclosure () throws -> Value,
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

