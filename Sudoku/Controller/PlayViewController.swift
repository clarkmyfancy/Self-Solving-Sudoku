import UIKit
import Foundation

class PlayViewController: UIViewController {
    @IBOutlet weak var borderAndOutlines: UIView!
    
    @IBOutlet weak var puzzleWithNumbersView: UICollectionView!
    
    let puzzle: [[Int]] = [
        [1, 8, 5, 4, 0, 0, 2, 0, 0], // elem at [0,0] used to be a 0
        [0, 4, 6, 0, 0, 2, 0, 7, 0],
        [0, 0, 0, 6, 0, 3, 5, 4, 0],
        
        [0, 0, 0, 0, 2, 5, 0, 1, 0],
        [7, 0, 0, 8, 6, 0, 0, 2, 0],
        [0, 0, 4, 1, 0, 7, 0, 0, 8],
        
        [4, 0, 0, 3, 0, 1, 0, 6, 2],
        [0, 0, 0, 7, 0, 0, 4, 0, 3],
        [0, 3, 0, 0, 4, 0, 1, 5, 0],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        puzzleWithNumbersView.delegate = self
        puzzleWithNumbersView.dataSource = self
        
        let layout = puzzleWithNumbersView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.minimumInteritemSpacing = 0
        layout?.minimumLineSpacing = 0
        
        
        // in order to use a custom .xib file you have to register it
        puzzleWithNumbersView.register(UINib(nibName: K.subGridNibName, bundle: nil), forCellWithReuseIdentifier: K.subGridReuseIdentifier)
        
        borderAndOutlines.setNeedsDisplay()
        puzzleWithNumbersView.setNeedsDisplay()
    }
}

extension PlayViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
        let row = indexPath[1] / 9
        let col = indexPath[1] % 9
        print(puzzle[row][col])
        if collectionView.cellForItem(at: indexPath)?.backgroundColor == .green {
            collectionView.cellForItem(at: indexPath)?.backgroundColor = .clear
        } else {
            collectionView.cellForItem(at: indexPath)?.backgroundColor = .green
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
//    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        collectionView.cellForItem(at: indexPath)?.backgroundColor = .red
//        return true
//    }
}

extension PlayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 81}
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.subGridReuseIdentifier, for: indexPath) as! SubGridCell
        let row = indexPath[1] / 9
        let col = indexPath[1] % 9
        if puzzle[row][col] == 0 {
            cell.cellValueLabel.text = " "
        } else {
            cell.cellValueLabel.text = String(puzzle[row][col])
        }
        
        return cell
        
    }
}

/// margin and padding b/w each cell
extension PlayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //        let thinLineHoriz = Double(collectionView.frame.size.width) / 500.0
        //        let thinLineVert = Double(collectionView.frame.size.height) / 500.0
        let width = (Double(collectionView.frame.size.width) / 9.0)
        let height = (Double(collectionView.frame.size.height) / 9.0)
        return CGSize(width: width, height: height)
    }
}
/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */




