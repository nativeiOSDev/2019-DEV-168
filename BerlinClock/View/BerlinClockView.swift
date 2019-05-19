import UIKit

class BerlinClockView: UIView {
    
    // MARK: Properties
    
    private var isSecondsBlockEnabled: Bool!
    private var numberOfFiveMinBlockToEnable: Int!
    private var numberOfOneMinBlockToEnable: Int!
    private var numberOfFiveHourBlockToEnable: Int!
    private var numberOfOneHourBlockToEnable: Int!
    
    private var centerX: CGFloat!
    private var centerY: CGFloat!
    private var blocksRowHeight: CGFloat!
    private var blocksHeight: CGFloat!
    
    // MARK: Methods
    
    func updateBerlinClockUI(isSecondsBlockEnabled: Bool, numberOfFiveMinBlockToEnable: Int,
                             numberOfOneMinBlockToEnable: Int, numberOfFiveHourBlockToEnable: Int,
                             numberOfOneHourBlockToEnable: Int) {
        
        self.isSecondsBlockEnabled = isSecondsBlockEnabled
        self.numberOfFiveMinBlockToEnable = numberOfFiveMinBlockToEnable
        self.numberOfOneMinBlockToEnable = numberOfOneMinBlockToEnable
        self.numberOfFiveHourBlockToEnable = numberOfFiveHourBlockToEnable
        self.numberOfOneHourBlockToEnable = numberOfOneHourBlockToEnable
        setNeedsDisplay()
    }
    
    // MARK: Clock View Rendering
    
    override func draw(_ rect: CGRect) {
        guard let currentContext = UIGraphicsGetCurrentContext() else {
            return
        }
        currentContext.clear(rect)
        centerX = rect.width / 2
        centerY = rect.height / 2
        blocksRowHeight = rect.size.height / 10
        blocksHeight = bounds.height / 12
        createSecondsBlockView(in: currentContext)
        createFiveHourBlockView(in: currentContext)
        createOneHourBlockView(in: currentContext)
        createFiveMinuteBlockView(in: currentContext)
        createOneMinuteBlockView(in: currentContext)
        super.draw(rect)
    }
    
    // MARK: Seconds block rendering
    
    private func createSecondsBlockView(in context: CGContext) {
        guard isSecondsBlockEnabled != nil  else {
            return
        }
        let radiusOfSecondsBlock: CGFloat = bounds.width / 6
        var colors: [CGColor]
        colors = isSecondsBlockEnabled == true ? [UIColor.orange.cgColor]:[UIColor.brown.cgColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors as CFArray,
                                  locations: [0.0, 1.0])!
        let startPoint = CGPoint(x: centerX, y: 2*radiusOfSecondsBlock + radiusOfSecondsBlock / 2)
        let endPoint = CGPoint(x: centerX, y: 2*radiusOfSecondsBlock + radiusOfSecondsBlock / 2)
        
        context.drawRadialGradient(gradient, startCenter: startPoint, startRadius: 0, endCenter: endPoint, endRadius: radiusOfSecondsBlock, options: [])
    }
    
    // MARK: Five Hour blocks row rendering
    
    private func createFiveHourBlockView(in context: CGContext) {
        guard numberOfFiveHourBlockToEnable != nil  else {
            return
        }
        let widthOfFiveHourBlock: CGFloat = ((bounds.width - (BerlinClockConstants.PADDING * (CGFloat(BerlinClockConstants.NUMBER_OF_HOUR_BLOCKS) + 1))) / CGFloat(BerlinClockConstants.NUMBER_OF_HOUR_BLOCKS))
        
        drawAndFillTimeBlocks(width: widthOfFiveHourBlock, height: blocksHeight,
                              yPosition: centerY - blocksRowHeight, leadingSpace: BerlinClockConstants.PADDING,
                              trailingSpace: BerlinClockConstants.PADDING, highlightColor: UIColor.red.cgColor,
                              blocksCount: BerlinClockConstants.NUMBER_OF_HOUR_BLOCKS, context: context,
                              noOfBlocksToEnable: numberOfFiveHourBlockToEnable)
    }
    
    // MARK: One Hour blocks row rendering
    
    private func createOneHourBlockView(in context: CGContext) {
        guard numberOfOneHourBlockToEnable != nil  else {
            return
        }
        let widthOfEachOneHourBlock: CGFloat = ((bounds.width - (BerlinClockConstants.PADDING * (CGFloat(BerlinClockConstants.NUMBER_OF_HOUR_BLOCKS) + 1))) / CGFloat(BerlinClockConstants.NUMBER_OF_HOUR_BLOCKS))
        
        drawAndFillTimeBlocks(width: widthOfEachOneHourBlock, height: blocksHeight,
                              yPosition: centerY, leadingSpace: BerlinClockConstants.PADDING,
                              trailingSpace: BerlinClockConstants.PADDING, highlightColor: UIColor.red.cgColor,
                              blocksCount: BerlinClockConstants.NUMBER_OF_HOUR_BLOCKS,
                              context: context, noOfBlocksToEnable: numberOfOneHourBlockToEnable)
    }
    
    // MARK: Five Minutes blocks row rendering
    
    private func createFiveMinuteBlockView(in context: CGContext) {
        guard numberOfFiveMinBlockToEnable != nil  else {
            return
        }
        let widthOfEachFiveMinuteBlock:CGFloat = ((bounds.width - 2 * BerlinClockConstants.PADDING - (BerlinClockConstants.PADDING / 2 * (CGFloat(BerlinClockConstants.NUMBER_OF_FIVEMINUTES_BLOCKS) - 1))) / CGFloat(BerlinClockConstants.NUMBER_OF_FIVEMINUTES_BLOCKS))
        
        drawAndFillTimeBlocks(width: widthOfEachFiveMinuteBlock, height: blocksHeight,
                              yPosition: centerY + blocksRowHeight, leadingSpace: BerlinClockConstants.PADDING / 2,
                              trailingSpace: BerlinClockConstants.PADDING,
                              highlightColor: UIColor.yellow.cgColor,
                              blocksCount: BerlinClockConstants.NUMBER_OF_FIVEMINUTES_BLOCKS,
                              context: context, noOfBlocksToEnable: numberOfFiveMinBlockToEnable)
    }
    
    // MARK: One Minute blocks row rendering
    
    private func createOneMinuteBlockView(in context: CGContext) {
        guard numberOfOneMinBlockToEnable != nil  else {
            return
        }
        let widthOfEachOneMinuteBlock: CGFloat = ((bounds.width - (BerlinClockConstants.PADDING * (CGFloat(BerlinClockConstants.NUMBER_OF_ONEMINUTES_BLOCKS) + 1))) / CGFloat(BerlinClockConstants.NUMBER_OF_ONEMINUTES_BLOCKS))
        
        drawAndFillTimeBlocks(width: widthOfEachOneMinuteBlock, height: blocksHeight,
                              yPosition: centerY + blocksRowHeight * 2, leadingSpace: BerlinClockConstants.PADDING,
                              trailingSpace: BerlinClockConstants.PADDING, highlightColor: UIColor.yellow.cgColor,
                              blocksCount: BerlinClockConstants.NUMBER_OF_ONEMINUTES_BLOCKS,
                              context: context, noOfBlocksToEnable: numberOfOneMinBlockToEnable)
    }
    
    // MARK: Blocks view rendering
    
    private func drawAndFillTimeBlocks(width: CGFloat, height: CGFloat, yPosition: CGFloat, leadingSpace: CGFloat,
                                       trailingSpace: CGFloat, highlightColor: CGColor, blocksCount: Int,
                                       context: CGContext, noOfBlocksToEnable: Int) {
        for i in 0..<blocksCount {
            let rect = CGRect(x: trailingSpace + CGFloat(i) * (width + leadingSpace), y: yPosition, width: width, height: height)
            var fillColor:CGColor
            if blocksCount > 4 {
                if i <= noOfBlocksToEnable {
                    fillColor = (i+1) % 3 == 0 ? UIColor.red.cgColor : UIColor.yellow.cgColor
                } else {
                    fillColor = UIColor.brown.cgColor
                }
            } else {
                fillColor = i <= noOfBlocksToEnable ? highlightColor : UIColor.brown.cgColor
            }
            context.setFillColor(fillColor)
            UIBezierPath.init(roundedRect: rect, cornerRadius: 6).fill()
        }
    }
}
