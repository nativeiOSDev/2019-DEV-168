import Foundation

// MARK: Converter Delegate

protocol TimeConverter:class {
    func getSecondsBlockStatus(time: Date) -> Bool
    func getNumberOfOneMinuteBlocksToEnable(time: Date) -> Int
    func getNumberOfFiveMinuteBlocksToEnable(time: Date) -> Int
    func getNumberOfOneHourBlocksToEnable(time: Date) -> Int
    func getNumberOfFiveHourBlocksToEnable(time: Date) -> Int
}

// MARK: Update Delegate

protocol ViewModelPropertyUpdateDelegate: class {
    func updateProperties(date: Date)
}
class DigitalToBerlinClockConverter {
    
    // MARK: Properties
    
    private var timer: Timer?
    private var timeInterval: TimeInterval!
    weak var viewModelPropertyUpdateDelegate: ViewModelPropertyUpdateDelegate?
    
    // MARK: Methods
    
    func startBerlinClock() {
        timeInterval = TimeInterval(1)
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval!, repeats: true, block: { time in
            self.viewModelPropertyUpdateDelegate?.updateProperties(date: Date())
        })
    }
    func stopBerlinClock() {
        timer?.invalidate()
    }
}
extension DigitalToBerlinClockConverter: TimeConverter {
    
    // MARK: Delegates
    
    func getSecondsBlockStatus(time: Date) -> Bool {
        guard let secondsElapsed = Calendar.current.dateComponents([.second], from: time).second else { return false }
        return (secondsElapsed % 2) == 0
    }
    
    func getNumberOfOneMinuteBlocksToEnable(time: Date) -> Int {
        guard var minutesElapsed = Calendar.current.dateComponents([.minute], from: time).minute else { return 0 }
        minutesElapsed = minutesElapsed > 0 ? (minutesElapsed % BerlinClockConstants.VALUE_OF_MINUTE_BLOCKS) - 1 :0
        return minutesElapsed
    }
    
    func getNumberOfFiveMinuteBlocksToEnable(time: Date) -> Int {
        guard var minutesElapsed = Calendar.current.dateComponents([.minute], from: time).minute else { return  0 }
        minutesElapsed = minutesElapsed > 0 ? (minutesElapsed / BerlinClockConstants.VALUE_OF_MINUTE_BLOCKS) - 1 : 0
        return minutesElapsed
    }
    
    func getNumberOfOneHourBlocksToEnable(time: Date) -> Int {
        guard var hoursElapsed = Calendar.current.dateComponents([.hour], from: time).hour else { return 0}
        hoursElapsed = hoursElapsed > 0 ? (hoursElapsed % BerlinClockConstants.VALUE_OF_HOUR_BLOCKS) - 1 : 0
        return hoursElapsed
    }
    
    func getNumberOfFiveHourBlocksToEnable(time: Date) -> Int {
        guard var hoursElapsed = Calendar.current.dateComponents([.hour], from: time).hour else { return 0}
        hoursElapsed = hoursElapsed > 0 ? (hoursElapsed / BerlinClockConstants.VALUE_OF_HOUR_BLOCKS) - 1 : 0
        return hoursElapsed
    }
}
