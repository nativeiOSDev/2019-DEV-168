import XCTest
@testable import BerlinClock

class BerlinClockTests: XCTestCase {
    
    var digitalToBerlinClockConverter: DigitalToBerlinClockConverter!
    var formatter: DateFormatter! = nil
    
    override func setUp() {
        digitalToBerlinClockConverter = DigitalToBerlinClockConverter()
        digitalToBerlinClockConverter.startBerlinClock()
        formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    override func tearDown() {
        digitalToBerlinClockConverter.stopBerlinClock()
    }
    
    // MARK: Seconds Block Test
    
    func testSecondsBlockLogic() {
        XCTAssertTrue(digitalToBerlinClockConverter.getSecondsBlockStatus(time:
            formatter.date(from: "2019-05-18 00:00:00")!))
        XCTAssertFalse(digitalToBerlinClockConverter.getSecondsBlockStatus(time:
            formatter.date(from: "2019-05-18 01:01:01")!))
        XCTAssertTrue(digitalToBerlinClockConverter.getSecondsBlockStatus(time:
            formatter.date(from: "2019-05-18 02:02:02")!))
        XCTAssertFalse(digitalToBerlinClockConverter.getSecondsBlockStatus(time:
            formatter.date(from: "2019-05-18 03:03:03")!))
    }
    
     // MARK: One Minute Block Row Test
    
    func testOneMinuteBlockEnablingLogic() {
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfOneMinuteBlocksToEnable(time:
            formatter.date(from: "2019-05-18 00:00:00")!), 0)
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfOneMinuteBlocksToEnable(time:
            formatter.date(from: "2019-05-18 01:01:01")!), 0)
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfOneMinuteBlocksToEnable(time:
            formatter.date(from: "2019-05-18 02:02:02")!), 1)
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfOneMinuteBlocksToEnable(time:
            formatter.date(from: "2019-05-18 03:03:03")!), 2)
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfOneMinuteBlocksToEnable(time:
            formatter.date(from: "2019-05-18 04:04:04")!), 3)
    }
    
    // MARK: Five Minute Block Row Test
    
    func testFiveMinuteBlockEnablingLogic() {
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfFiveMinuteBlocksToEnable(time:
            formatter.date(from: "2019-05-18 00:00:00")!), 0)
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfFiveMinuteBlocksToEnable(time:
            formatter.date(from: "2019-05-18 15:15:15")!), 2)
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfFiveMinuteBlocksToEnable(time:
            formatter.date(from: "2019-05-18 23:35:35")!), 6)
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfFiveMinuteBlocksToEnable(time:
            formatter.date(from: "2019-05-18 23:45:45")!), 8)
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfFiveMinuteBlocksToEnable(time:
            formatter.date(from: "2019-05-18 23:55:55")!), 10)
    }
    
    // MARK: One Hour Block Row Test
    
    func testOneHourBlockEnablingLogic() {
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfOneHourBlocksToEnable(time:
            formatter.date(from: "2019-05-18 00:00:00")!), 0)
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfOneHourBlocksToEnable(time:
            formatter.date(from: "2019-05-18 01:01:01")!), 0)
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfOneHourBlocksToEnable(time:
            formatter.date(from: "2019-05-18 02:02:02")!), 1)
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfOneHourBlocksToEnable(time:
            formatter.date(from: "2019-05-18 03:03:03")!), 2)
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfOneHourBlocksToEnable(time:
            formatter.date(from: "2019-05-18 04:04:04")!), 3)
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfOneHourBlocksToEnable(time:
            formatter.date(from: "2019-05-18 17:17:17")!), 1)
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfOneHourBlocksToEnable(time:
            formatter.date(from: "2019-05-18 23:59:59")!), 2)
    }
    
    // MARK: Five Hour Block Row Test
    
    func testFiveHourBlockEnablingLogic() {
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfFiveHourBlocksToEnable(time:
            formatter.date(from: "2019-05-18 00:00:00")!), 0)
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfFiveHourBlocksToEnable(time:
            formatter.date(from: "2019-05-18 11:11:11")!), 1)
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfFiveHourBlocksToEnable(time:
            formatter.date(from: "2019-05-18 17:17:17")!), 2)
        XCTAssertEqual(digitalToBerlinClockConverter.getNumberOfFiveHourBlocksToEnable(time:
            formatter.date(from: "2019-05-18 23:59:59")!), 3)
    }
}
