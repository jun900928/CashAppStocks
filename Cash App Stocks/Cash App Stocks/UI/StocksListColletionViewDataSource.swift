//
//  StocksListColletionViewDataSource.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/3/22.
//
import UIKit

class StocksListColletionViewDataSource: NSObject {
    
    let dataProvider: StocksListViewControllerDataProvider?

    init(_ dataProvider: StocksListViewControllerDataProvider?) {
        self.dataProvider = dataProvider
    }
}
    
extension StocksListColletionViewDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataProvider?.stocksList.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StocksListCollectionViewCell.cellID,
                                                         for: indexPath) as? StocksListCollectionViewCell,
              let stock = dataProvider?.stocksList[indexPath.row]
        else { return UICollectionViewCell()}
        
        cell.dataModel = StocksListCollectionViewCellDataModel(stock: stock)
        return cell
    }
}


