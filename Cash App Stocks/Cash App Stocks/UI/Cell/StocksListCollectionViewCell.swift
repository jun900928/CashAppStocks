//
//  StocksListCollectionViewCell.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/3/22.
//

import UIKit

class StocksListCollectionViewCell: UICollectionViewCell, CellIdentifierProvider {
    var dataModel: CollectionViewCellDataModel? {
        didSet {
            title.rightLabelText = dataModel?.title
            subtitle.rightLabelText = dataModel?.subtitle
            detail1.rightLabelText = dataModel?.detail1
            detail2.rightLabelText = dataModel?.detail2
            description1.rightLabelText = dataModel?.description1
            description2.rightLabelText = dataModel?.description2
        }
    }
    
    var labelDescriptions = StocksListCollectionViewCellPlaceHolderString()
    
    lazy var title: HListingView = createListing()
    lazy var subtitle: HListingView = createListing()
    lazy var detail1: HListingView = createListing()
    lazy var detail2: HListingView = createListing()
    lazy var description1: HListingView = createListing()
    lazy var description2: HListingView = createListing()
    
    lazy var allListViews = [title, subtitle ,detail1 ,detail2 ,description1 ,description2]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    override func prepareForReuse() {
        dataModel = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StocksListCollectionViewCell {
    private func createListing() -> HListingView {
        let listView = HListingView()
        listView.translatesAutoresizingMaskIntoConstraints = false
        return listView
    }
    
    private func addViews() {
        for index in 0..<allListViews.count {
            let listView = allListViews[index]
            contentView.addSubview(listView)
            listView.leftLabelText = labelDescriptions.description(index)
            listView.constrainToLayoutMarginsGuide(edges: .leading, .trailing)
            if index - 1 >= 0 {
                let previous = allListViews[index - 1]
                listView.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: .sepearateSpace).isActive = true
            }
        }
        if let first = allListViews.first {
            first.constrainToLayoutMarginsGuide(edge: .top)
        }
    }
    
    private func setupUI() {
        contentView.layer.borderColor = UIColor.systemGray2.cgColor
        contentView.layer.borderWidth = .sepearateLineSpace
        addViews()
    }
}

extension StocksListCollectionViewCell: CalculateSelfHeight {
    func calculateHieght(width: CGFloat) -> CGFloat {
        let width = width - contentView.layoutMargins.left  - contentView.layoutMargins.right
        var height = contentView.layoutMargins.top + contentView.layoutMargins.bottom
        for subview in allListViews {
            height += subview.calculateHieght(width: width) + .sepearateSpace
        }
        return height - .sepearateSpace
    }
}
