//
//  ExperienceViewController.swift
//  CitiMobileApp
//
//   on 05/24/2019.
//  Copyright © 2019 . All rights reserved.
//

import Foundation
import UIKit

class ExperienceViewController: UIViewController, ExperienceViewProtocol, UITabBarDelegate, UITableViewDataSource {

  static var storyboardFileName: String {
    return "Main"
  }

  @IBOutlet weak var tableView: UITableView!
  var presenter: ExperiencePresenterProtocol?
  var companyArray: [CompanyModel] = []
  let cellReuseIdentifier = "CompanyCell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewIsReady()
    tableView.tableFooterView = UIView()
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    guard let companies = presenter?.companies else {
      return 0
    }

    return companies.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell: ExperienceTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? ExperienceTableViewCell,
      let companyElement = presenter?.companies[indexPath.row] else {
      return UITableViewCell()
    }
    cell.companyImage.image = companyElement.image
    cell.companyName.text = companyElement.companyName
    cell.companyDate.text = companyElement.companyDate
    cell.companyPosition.text = companyElement.companyPosition
    cell.companyResponsabilities.text = companyElement.companyResponsabilities
    cell.companyAchivements.text = companyElement.companyAchivements

    return cell
  }

  func showCompanies() {
    tableView.reloadData()
  }
}
