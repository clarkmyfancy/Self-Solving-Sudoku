import UIKit
import Foundation

@IBDesignable class BorderAndPartitionLinesUI: UIView {
  
    let grid = Grid()
    
    override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(CGColor(srgbRed: 0.4, green: 0.0, blue: 0.0, alpha: 1.0))
            context.setLineWidth(1.0)
            drawGridUI(with: context, having: Dimensions(self.bounds.size.width,self.bounds.size.height))}}
            
    func drawGridUI(with context: CGContext, having dimension: Dimensions) {
        drawBorder(with: context, having: dimension.width, and: dimension.height)
        drawGridPartitions(with: context, having: dimension.width, and: dimension.height)
        drawCellPartitions(with: context, having: dimension.width, and: dimension.height)}
        
    func drawBorder(with context: CGContext, having width: CGFloat, and height: CGFloat) {
        let path = UIBezierPath(rect: CGRect(x: 1, y: 1, width: width-2.0, height: height-2.0))
        path.lineWidth = 3.0
        path.stroke()}
    
    func drawGridPartitions(with context: CGContext, having width: CGFloat, and height: CGFloat) {
        drawVerticalGridPartitions(with: context, having: width, and: height)
        drawHorizontalGridPartitions(with: context, having: width, and: height)}
    
    func drawVerticalGridPartitions(with context: CGContext, having width: CGFloat, and height: CGFloat) {
        let gridWidth = (width - 4.0*grid.subGridBorderWidth) / 3.0
        for i in 1..<3 {
            let path = UIBezierPath(rect: CGRect(x: CGFloat(i) * (gridWidth + grid.subGridBorderWidth), y: 0, width: 0.0, height: height))
            path.lineWidth = grid.subGridBorderWidth / 2
            path.stroke()}}
    
    func drawHorizontalGridPartitions(with context: CGContext, having width: CGFloat, and height: CGFloat) {
        let gridHeight = (height - 4*grid.subGridBorderWidth) / 3.0
        for j in 1..<3 {
            let path = UIBezierPath(rect: CGRect(x: 0, y: CGFloat(j)*(gridHeight + grid.subGridBorderWidth), width: width, height: 0.0))
            path.lineWidth = grid.subGridBorderWidth / 2.0
            path.stroke()}}
    
    func drawCellPartitions(with context: CGContext, having width: CGFloat, and height: CGFloat) {
        drawVerticalCellPartitions(with: context, having: width, and: height)
        drawHorizontalCellPartitions(with: context, having: width, and: height)}
    
    func drawVerticalCellPartitions(with context: CGContext, having width: CGFloat, and height: CGFloat) {
        let gridWidth = (width - 4.0*grid.subGridBorderWidth) / 3.0
        let cellWidth = (gridWidth - 2.0*grid.cellBorderWidth) / 3.0
        for I in 1...3 {
            for i in 1..<3 {
                let startingPoint = grid.subGridBorderWidth + (CGFloat(I - 1) * CGFloat(gridWidth + grid.subGridBorderWidth)) + ((CGFloat(i) * (cellWidth)) + (CGFloat(i - 1) * grid.cellBorderWidth))
                let path = UIBezierPath(rect: CGRect(x: startingPoint, y: 0, width: 0.0, height: height))
                path.lineWidth = grid.cellBorderWidth / 2
                path.stroke()}}}
    
    func drawHorizontalCellPartitions(with context: CGContext, having width: CGFloat, and height: CGFloat) {
        let gridWidth = (width - 4.0*grid.subGridBorderWidth) / 3.0
        let cellWidth = (gridWidth - 2.0*grid.cellBorderWidth) / 3.0
        for J in 1...3 {
            for j in 1..<3 {
                let startingPoint = grid.subGridBorderWidth + (CGFloat(J - 1) * CGFloat(gridWidth + grid.subGridBorderWidth)) + ((CGFloat(j) * (cellWidth)) + (CGFloat(j - 1) * grid.cellBorderWidth))
                let path = UIBezierPath(rect: CGRect(x: 0, y: startingPoint, width: width, height: 0.0))
                path.lineWidth = grid.cellBorderWidth / 2
                path.stroke()}}}
}
