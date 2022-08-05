//
//  StocksListViewController.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/3/22.
//

import UIKit

class StocksListViewController: UIViewController {
    let dataProvider: StocksListViewControllerDataProvider & RemoteDataProvider
    
    weak var coordinator: StocksListCoordinator?
    
    lazy var retryButton: UIButton = {
        let image = UIImage(named: "SomethingWrong")
        var configuration = UIButton.Configuration.plain()
        var container = AttributeContainer()
        container.font = UIFont.boldSystemFont(ofSize: 20)
        configuration.attributedTitle = AttributedString("Click To Try Again", attributes: container)
        configuration.image = image
        configuration.titleAlignment = .center
        configuration.imagePlacement = .top
        configuration.imagePadding = 10
        
        let button = UIButton.init(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        button.addTarget(self, action: #selector(refreshData), for: .touchUpInside)
        return button
    }()
    
    lazy var refresher: UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString.init(string: "Loading")
        refresher.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return refresher
    }()
    
    lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        cv.register(StocksListCollectionViewCell.self, forCellWithReuseIdentifier: StocksListCollectionViewCell.cellID)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.alwaysBounceVertical = true
        return cv
    }()
    
    lazy var collectionViewDelegate: StocksListCollectionViewDelegateFlowLayout = {
        let delegate = StocksListCollectionViewDelegateFlowLayout(dataProvider)
        return delegate
    }()
    
    lazy var collectionViewDataSource: StocksListColletionViewDataSource = {
        let ds = StocksListColletionViewDataSource(dataProvider)
        return ds
    }()
    
    init(_ dataProvider: StocksListViewControllerDataProvider & RemoteDataProvider, coordinator: StocksListCoordinator) {
        self.coordinator = coordinator
        self.dataProvider = dataProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        refreshData()
    }
    
    func setupUI() {
        title = "Cash App Stocks"
        view.addSubview(collectionView)
        view.backgroundColor = .systemBackground
        setupCollection()
        setRetryButton()
    }
    
    func setupCollection() {
        collectionView.addSubview(refresher)
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDelegate
        collectionView.constrainToSuperviewLayoutMarginsGuide()
    }
    
    func setRetryButton() {
        view.addSubview(retryButton)
        retryButton.constrainToLayoutMarginsGuide(edges: .centerY, .centerX)
    }
}

extension StocksListViewController {
    // when device rotate, relayout the collection view
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
        super.viewWillTransition(to: size, with: coordinator)
    }
}

// MARK: - UIRefreshControl
extension StocksListViewController {
    @objc func refreshData(){
        let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
        beginRefreshing()
        dataProvider.fetchData(NetworkRequest(.portfolioMalformed)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.collectionView.reloadData()
                if let response = response as? StocksResponse, response.stocks.isEmpty{
                    self.coordinator?.errorHandling(NetworkError.emptyData, on: self)
                }
            case .failure(let error):
                self.coordinator?.errorHandling(error, on: self)
            }
            self.stopRefresher()
            self.showRetryButtonIfNeed()
        }
    }
    
    func stopRefresher() {
        refresher.endRefreshing()
    }
    
    func beginRefreshing() {
        refresher.beginRefreshing()
    }
    
    func showRetryButtonIfNeed() {
        if !refresher.isRefreshing && dataProvider.stocksList.isEmpty {
            retryButton.isHidden = false
        } else {
            retryButton.isHidden = true
        }
    }
}
