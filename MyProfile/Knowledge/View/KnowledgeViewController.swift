import Foundation
import UIKit

class KnowledgeViewController: UIViewController, KnowledgeViewProtocol {

  @IBOutlet weak var collectionView: UICollectionView!

  static var storyboardFileName: String {
    return "Main"
  }

  var presenter: KnowledgePresenterProtocol?

  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollection()
    presenter?.fetchSkills()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }

  private func setupCollection() {
    let bubbleLayout = CollectionViewBubbleLayout()
    bubbleLayout.minimumLineSpacing = 6.0
    bubbleLayout.minimumInteritemSpacing = 6.0
    bubbleLayout.delegate = self
    collectionView.setCollectionViewLayout(bubbleLayout, animated: false)
  }

  func showSkills() {
    collectionView.reloadData()
  }
}

extension KnowledgeViewController: UICollectionViewDataSource, UICollectionViewDelegate, CollectionViewBubbleLayoutDelegate {

  // MARK: -
  // MARK: - UICollectionView Delegate & Datasource

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    guard let skills = presenter?.skills else {
      return 0
    }
    return skills.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let indentifier = BubbleCollectionViewCell.identifier
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indentifier, for: indexPath) as? BubbleCollectionViewCell, let skills = presenter?.skills else {
      return UICollectionViewCell()
    }
    cell.lblTitle.text = skills[indexPath.row].name
    cell.backgroundColor = skills[indexPath.row].color
    return cell
  }


  // MARK: -
  // MARK: - CollectionViewBubbleLayoutDelegate
  func collectionView(_ collectionView: UICollectionView, itemSizeAt indexPath: IndexPath) -> CGSize
  {
    guard let skills = presenter?.skills else {
      return .zero
    }

    let title = skills[indexPath.row].name
    let font =  UIFont(name: "HelveticaNeue-Bold", size: 15.0) ?? .systemFont(ofSize: 15.0)
    var size = title.size(withAttributes: [NSAttributedString.Key.font: font])
    size.width = CGFloat(ceilf(Float(size.width + 30.0)))
    size.height = 40.0

    //...Checking if item width is greater than collection view width then set item width == collection view width.
    if size.width > collectionView.frame.size.width {
      size.width = collectionView.frame.size.width
    }

    return size;
  }

}
