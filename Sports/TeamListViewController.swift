//
//  TeamListViewController.swift
//  Sports
//
//  Created by Tyler J Schultz on 10/12/16.
//  Copyright © 2016 Ty Schultz. All rights reserved.
//

import UIKit
import IGListKit
class TeamListViewController: UIViewController, IGListAdapterDataSource, UIScrollViewDelegate {
    
    lazy var adapter: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    let collectionView = IGListCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    lazy var teams : [Any] = []
    var loading = false
    let spinToken = NSObject()
    let gridItem = NSObject()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        teams.append(GridItem(color: UIColor(red: 237/255.0, green: 73/255.0, blue: 86/255.0, alpha: 1), itemCount: 32))
        
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        adapter.scrollViewDelegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    //MARK: IGListAdapterDataSource
    
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        var items: [IGListDiffable] = teams as! [IGListDiffable]
        return items
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        return GridSectionController()
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? { return nil }
    
    
}
