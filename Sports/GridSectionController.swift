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

class GridItem: NSObject {

    let color: UIColor
    let itemCount: Int

    init(color: UIColor, itemCount: Int) {
        self.color = color
        self.itemCount = itemCount
    }
}

class GridSectionController: IGListSectionController, IGListSectionType {

    var object: GridItem?

    override init() {
        super.init()
        self.minimumInteritemSpacing = 8
        self.minimumLineSpacing = 8
        self.inset = UIEdgeInsets(top: 16, left: 16, bottom: 8, right: 16)
    }

    func numberOfItems() -> Int {
        return object?.itemCount ?? 0
    }

    func sizeForItem(at index: Int) -> CGSize {
        let width = collectionContext?.containerSize.width ?? 0
        
        let itemSize = floor(width / 3) - 16
        return CGSize(width: itemSize, height: itemSize*1.35)
    }

    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: CenterLabelCell.self, for: self, at: index) as! CenterLabelCell
        let rand = randomTeam(index: index)
        cell.image.image = UIImage(named: rand)
        cell.label.text = rand
        return cell
    }

    func didUpdate(to object: Any) {
        self.object = object as? GridItem
    }

    func didSelectItem(at index: Int) {}
    
    
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
            return "Arizona"
        }
    }

}
