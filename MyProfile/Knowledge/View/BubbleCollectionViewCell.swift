import Foundation

import UIKit

class BubbleCollectionViewCell: UICollectionViewCell {
  static let identifier: String = "BubbleCollectionViewCell"
  @IBOutlet weak var lblTitle:UILabel!
  var color: UIColor = .white

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    self.layer.cornerRadius = self.frame.size.height / 2
  }
}
