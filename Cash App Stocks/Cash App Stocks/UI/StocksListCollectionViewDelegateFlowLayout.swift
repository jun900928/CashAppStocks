//
//  StocksListCollectionViewDelegateFlowLayout.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/3/22.
//

import UIKit

class StocksListCollectionViewDelegateFlowLayout: NSObject {
    let dataProvider: StocksListViewControllerDataProvider?
    
    init(_ dataProvider: StocksListViewControllerDataProvider?) {
        self.dataProvider = dataProvider
    }
}

extension StocksListCollectionViewDelegateFlowLayout: UICollectionViewDelegateFlowLayout {
    
    func referenceWidth(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewFlowLayout) -> CGFloat {
        let maxWidth = 350.0
        let sectionInset = collectionViewLayout.sectionInset
        
        let width = collectionView.safeAreaLayoutGuide.layoutFrame.width
            - sectionInset.left
            - sectionInset.right
            - collectionView.contentInset.left
            - collectionView.contentInset.right
        return min(maxWidth, width)
    }
    
    //Calculate the height base on its content
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let collectionViewLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize.zero }
        guard let dataProvider = self.dataProvider else { return CGSize.zero }
        guard indexPath.row < dataProvider.stocksList.count else { return CGSize.zero}
        
        let referenceWidth = referenceWidth(collectionView, layout: collectionViewLayout)
        let sizingCell = StocksListCollectionViewCell()
        sizingCell.dataModel = StocksListCollectionViewCellDataModel(stock: dataProvider.stocksList[indexPath.row])
        let referenceHeight = sizingCell.calculateHieght(width: referenceWidth)
        return CGSize(width: referenceWidth, height: referenceHeight)
    }
    
    //Calculate the horizontal insets base on its content
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        guard let collectionViewLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return UIEdgeInsets.zero }
        
        let referenceWidth = referenceWidth(collectionView, layout: collectionViewLayout)
                
        let numberOfCells = floor(collectionView.safeAreaLayoutGuide.layoutFrame.size.width / referenceWidth)
        let edgeInsets = (collectionView.frame.size.width - (numberOfCells * referenceWidth)) / (numberOfCells + 1)
        
        return UIEdgeInsets(top: 0, left: edgeInsets, bottom: 0, right: edgeInsets)
    }
}
