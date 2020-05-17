import UIKit
import Foundation

class PlayViewController: UIViewController {
    @IBOutlet weak var borderAndOutlines: UIView!
    @IBOutlet weak var puzzleWithNumbersView: UICollectionView!
    
    var highlightedCellPath: IndexPath?
    var selectedNumber: String = ""
    
    let sudokuManager = SudokuManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // in order to use a custom .xib file you have to register it
        puzzleWithNumbersView.register(UINib(nibName: K.subGridNibName, bundle: nil), forCellWithReuseIdentifier: K.subGridReuseIdentifier)
        puzzleWithNumbersView.delegate = self
        puzzleWithNumbersView.dataSource = self
        puzzleWithNumbersView.setNeedsDisplay()
        let layout = puzzleWithNumbersView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.minimumInteritemSpacing = 0
        layout?.minimumLineSpacing = 0
        
        borderAndOutlines.setNeedsDisplay()}
    
    @IBAction func onPressedNumber(_ sender: UIButton) {
        selectedNumber = sender.currentTitle!
    }
}

extension PlayViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
        let row = indexPath[1] / 9
        let col = indexPath[1] % 9
        print(sudokuManager.puzzle[row][col])
        highlightedCellPath = indexPath
        if collectionView.cellForItem(at: indexPath)?.backgroundColor == .green {
            collectionView.cellForItem(at: indexPath)?.backgroundColor = .clear
            let thing = collectionView.cellForItem(at: indexPath) as! SubGridCell
            thing.cellValueLabel.text = selectedNumber
        } else {
            collectionView.cellForItem(at: indexPath)?.backgroundColor = .green}}
}

extension PlayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 81}
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.subGridReuseIdentifier, for: indexPath) as! SubGridCell
        let row = indexPath[1] / 9
        let col = indexPath[1] % 9
        if sudokuManager.puzzle[row][col] == 0 {
            cell.cellValueLabel.text = " "}
        else {
            cell.cellValueLabel.text = String(sudokuManager.puzzle[row][col])}
        return cell}
}

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
