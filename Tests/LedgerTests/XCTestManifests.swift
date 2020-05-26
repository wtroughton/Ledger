import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(LedgerTests.allTests),
        testCase(OrderTests.allTests),
    ]
}
#endif
