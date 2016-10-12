/**
 Copyright (c) 2016-present, Facebook, Inc. All rights reserved.

 The examples provided by Facebook are for non-commercial testing and evaluation
 purposes only. Facebook reserves all rights not expressly granted.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 FACEBOOK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import UIKit
import IGListKit

class Monday: NSObject {
    var homeTeam : String
    var awayTeam : String
    
    init(homeTeam : String, awayTeam : String){
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
    }
}

class MainScheduleViewController: UIViewController, IGListAdapterDataSource, UIScrollViewDelegate {

    lazy var adapter: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    let collectionView = IGListCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())

    lazy var words : [Any] = []
    var loading = false
    let spinToken = NSObject()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let e = Monday(homeTeam: "adf", awayTeam: "asdf")
        words = []
        words.append(spinToken)
        
        let g = Game()
        g.homeTeam = "Arizona"
        g.awayTeam = "Carolina"
    
        let g2 = Game()
        g2.homeTeam = "Cleveland"
        g2.awayTeam = "Houston"
        
        for index in 1...19 {
            
            let rand = Int(arc4random_uniform(19))
            let rand2 = Int(arc4random_uniform(19))

            let g = Game()
            g.homeTeam = randomTeam(index: rand)
            g.awayTeam = randomTeam(index: rand2)
            words.append(g)
            
            if index == 5 || index == 14 {
                words.append(spinToken)
            }
        }
        
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
        var items: [IGListDiffable] = words as! [IGListDiffable]
        if loading {
            items.append(spinToken)
        }
        return items
    }

    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        if let obj = object as? NSObject, obj === spinToken {
            return MondayGameController()
        } else {
            return SundayGameController()
        }
    }

    func emptyView(for listAdapter: IGListAdapter) -> UIView? { return nil }

//    //MARK: UIScrollViewDelegate
//
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
//        if !loading && distance < 200 {
//            loading = true
//            adapter.performUpdates(animated: true, completion: nil)
//            DispatchQueue.global(qos: .default).async(execute: {
//                // fake background loading task
//                sleep(2)
//                DispatchQueue.main.async {
//                    self.loading = false
////                    self.words.append(contentsOf: "Etiam porta sem malesuada magna mollis euismod".components(separatedBy: " "))
//                    self.adapter.performUpdates(animated: true, completion: nil)
//                }
//            })
//        }
//    }

    func randomTeam(index : Int) -> String {
        
        switch index {
        case 1:
            return "Arizona"
        case 2:
            return "Atlanta"
        case 3:
            return "Baltimore"
        case 4:
            return "Buffalo"
        case 5:
            return "Carolina"
        case 6:
            return "Chicago"
        case 7:
            return "Cincinatti"
        case 8:
            return "Cleveland"
        case 9:
            return "Dallas"
        case 10:
            return "Denver"
        case 11:
            return "Detroit"
        case 12:
            return "GreenBay"
        case 13:
            return "Houston"
        case 14:
            return "Indianapolis"
        case 15:
            return "Jacksonville"
        case 16:
            return "KansasCity"
        case 17:
            return "LosAngeles"
        case 18:
            return "Miami"
        case 19:
            return "Minnesota"
    
        default:
            return ""
        }
    }

}
