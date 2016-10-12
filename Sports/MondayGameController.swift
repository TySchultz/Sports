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

class MondayGameController: IGListSectionController, IGListSectionType {

    var object: Game?

    func numberOfItems() -> Int {
        return 1
    }

    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 80)
    }

    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: SundayGameCell.self, for: self, at: index) as! SundayGameCell
        cell.homeTeamImage.image = UIImage(named: object!.homeTeam)
        cell.awayTeamImage.image = UIImage(named: object!.awayTeam)
        cell.homeTeamName.text = object?.homeTeam
        cell.awayTeamName.text = object?.awayTeam
        cell.homeTeamScore.text = "23"
        cell.awayTeamScore.text = "43"
        cell.timeLabel.text = "Final"
        
        return cell
    }

    func didUpdate(to object: Any) {
        self.object = object as? Game
    }

    func didSelectItem(at index: Int) {}

}
