import UIKit

class BerlinClockViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet var berlinClockView: BerlinClockView!
    
    // MARK: Properties
    
    var berlinClockViewModel: BerlinClockViewModel!
    
    // MARK: Initializer
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        berlinClockViewModel = BerlinClockViewModel(withDelegate: self )
    }
}
extension BerlinClockViewController: DataBindingDelegate {
    
    // MARK: Data Binding Delegate
    
    func prepareBerlinClockViewData() {
        
        guard  let isSecondsBlockEnabled = berlinClockViewModel.isSecondsBlockEnabled,
            let numberOfFiveMinBlockToEnable = berlinClockViewModel.numberOfFiveMinBlockToEnable,
            let numberOfOneMinBlockToEnable = berlinClockViewModel.numberOfOneMinBlockToEnable,
            let numberOfFiveHourBlockToEnable = berlinClockViewModel.numberOfFiveHourBlockToEnable,
            let numberOfOneHourBlockToEnable = berlinClockViewModel.numberOfOneHourBlockToEnable
            else { return }
        
        berlinClockView.updateBerlinClockUI( isSecondsBlockEnabled: isSecondsBlockEnabled,
                                             numberOfFiveMinBlockToEnable: numberOfFiveMinBlockToEnable,
                                             numberOfOneMinBlockToEnable: numberOfOneMinBlockToEnable,
                                             numberOfFiveHourBlockToEnable: numberOfFiveHourBlockToEnable,
                                             numberOfOneHourBlockToEnable: numberOfOneHourBlockToEnable)
    }
}
