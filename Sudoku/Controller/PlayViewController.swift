import UIKit
import Foundation
import CoreFoundation

class PlayViewController: UIViewController {
        @IBOutlet weak var
    
    //    var timer = Timer()
    elapsedTimeLabel: UILabel!
    
    var sudokuManager = SudokuManager()
    
    @IBOutlet weak var borderAndOutlines: UIView!
    @IBOutlet weak var puzzleWithNumbersView: UICollectionView!
        
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    var selectedNumber: String = ""
    
    var userHasNotTouchedAnyButtonsYet: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        loadPuzzle()
        initSudokuPuzzleCollectionView()
        setLayoutOfSodukuGridUI()
        puzzleWithNumbersView.setNeedsDisplay()
        borderAndOutlines.setNeedsDisplay()
//        sudokuManager.startTimer()
    }
//        timer = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: true, block: { _ in
//            self.elapsedTimeLabel.text = String(format: "%.2f", self.sudokuManager.getElapsedTime())})}
    func loadPuzzle() {
        sudokuManager.loadPuzzle()
    }
    
    func initSudokuPuzzleCollectionView() {
        puzzleWithNumbersView.register(
            UINib(nibName: K.subGridNibName, bundle: nil),
            forCellWithReuseIdentifier: K.subGridReuseIdentifier)
        puzzleWithNumbersView.delegate = self
        puzzleWithNumbersView.dataSource = self}
    
    func setLayoutOfSodukuGridUI() {
        let layout = puzzleWithNumbersView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.minimumInteritemSpacing = 0
        layout?.minimumLineSpacing = 0}
    
    @IBAction func onPressedNumber(_ sender: UIButton) {
        if selectedNumber == sender.currentTitle! {
            selectedNumber = ""}
        else {
            selectedNumber = sender.currentTitle!}
        updateUI(withContextFrom: sender)}
    
    func updateUI(withContextFrom sender: UIButton) {
        dispatchThreadToResetButtonAlphaAsync()
        setAlphaOfSender(sender, Double(sender.alpha))}
    
    func dispatchThreadToResetButtonAlphaAsync() {
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.resetButtonAlphas()})}
    
    func resetButtonAlphas() {
        self.oneButton.alpha = 0.5
        self.twoButton.alpha = 0.5
        self.threeButton.alpha = 0.5
        self.fourButton.alpha = 0.5
        self.fiveButton.alpha = 0.5
        self.sixButton.alpha = 0.5
        self.sevenButton.alpha = 0.5
        self.eightButton.alpha = 0.5
        self.nineButton.alpha = 0.5}
    
    func setAlphaOfSender(_ sender: UIButton, _ alpha: Double) {
        var chosenButtonAlpha: CGFloat
        if userHasNotTouchedAnyButtonsYet {
            userHasNotTouchedAnyButtonsYet = false
            chosenButtonAlpha = 1.0}
        else {
            if alpha == 0.5 {
                chosenButtonAlpha = 1.0}
            else {
                chosenButtonAlpha = 0.5}}
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.resetButtonAlphas()
            sender.alpha = chosenButtonAlpha})}
}

//MARK: - UICollectionView Data Source

extension PlayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 81}
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.subGridReuseIdentifier, for: indexPath) as! SubGridCell
        let row: Int = indexPath[1] / 9
        let col: Int = indexPath[1] % 9
        if noNumberGiven(for: row, and: col) {
            cell.cellValueLabel.text = " "}
        else {
            cell.cellValueLabel.text = String(sudokuManager.getNumberUsingCoordinates(row, col))}
        return cell
    }
    
    func noNumberGiven(for row: Int, and col: Int) -> Bool {
        return sudokuManager.getNumberUsingCoordinates(row, col) == 0
    }
}

//MARK: - UICollectionView Delegate

extension PlayViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SubGridCell
        let row = indexPath[1] / 9
        let col = indexPath[1] % 9
        if cellIsEditableAtLocation(x: row, y: col) {
            sudokuManager.updateCellAtLocationWithNumber(x: row, y: col, selectedNumber)
        }
        collectionView.reloadData()
    }
    
    func cellIsEditableAtLocation(x row: Int, y col: Int) -> Bool {
        return sudokuManager.determineWhetherNumberWasGivenUsingCoordinates(row, col)
    }
}


//MARK: - UICollectionView Delegate Flow Layout

extension PlayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (Double(collectionView.frame.size.width) / 9.0)
        let height = (Double(collectionView.frame.size.height) / 9.0)
        return CGSize(width: width, height: height)}
}




/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */
