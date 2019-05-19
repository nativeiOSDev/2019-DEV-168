import Foundation
import UIKit

// MARK: Delegates

protocol DataBindingDelegate: class {
    func prepareBerlinClockViewData()
}

class BerlinClockViewModel: ViewModelPropertyUpdateDelegate {
    
    // MARK: Properties
    
    private weak var dataBindingDelegate: DataBindingDelegate?
    private var digitalToBerlinClockConverter: DigitalToBerlinClockConverter
    
    var isSecondsBlockEnabled: Bool?
    var numberOfFiveHourBlockToEnable: Int?
    var numberOfOneHourBlockToEnable: Int?
    var numberOfFiveMinBlockToEnable: Int?
    var numberOfOneMinBlockToEnable: Int?
    
    // MARK: Initializer
    
    init(withDelegate dataBindingDelegate: UIViewController & DataBindingDelegate) {
        digitalToBerlinClockConverter = DigitalToBerlinClockConverter()
        digitalToBerlinClockConverter.startBerlinClock()
        digitalToBerlinClockConverter.viewModelPropertyUpdateDelegate = self
        self.dataBindingDelegate = dataBindingDelegate
    }
    
    // MARK: Function
    
    func updateProperties (date: Date) {
        isSecondsBlockEnabled = digitalToBerlinClockConverter.getSecondsBlockStatus(time: date)
        numberOfFiveMinBlockToEnable = digitalToBerlinClockConverter.getNumberOfFiveMinuteBlocksToEnable(time: date)
        numberOfOneMinBlockToEnable = digitalToBerlinClockConverter.getNumberOfOneMinuteBlocksToEnable(time: date)
        numberOfFiveHourBlockToEnable = digitalToBerlinClockConverter.getNumberOfFiveHourBlocksToEnable(time: date)
        numberOfOneHourBlockToEnable = digitalToBerlinClockConverter.getNumberOfOneHourBlocksToEnable(time: date)
        dataBindingDelegate?.prepareBerlinClockViewData()
    }
}
