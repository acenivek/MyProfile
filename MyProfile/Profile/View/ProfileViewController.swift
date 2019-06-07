//
//  ProfileViewController.swift
//  CitiMobileApp
//
//   on 05/24/2019.
//  Copyright © 2019 . All rights reserved.
//

import Foundation
import UIKit
import MessageUI


class ProfileViewController: UIViewController, ProfileViewProtocol {

  @IBOutlet weak var profileImageView: UIImageView!
  @IBOutlet weak var summaryTextView: UITextView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var phoneNumberLabel: UILabel!
  @IBOutlet weak var mailLabel: UILabel!

  static var storyboardFileName: String {
    return "Main"
  }

  var presenter: ProfilePresenterProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewIsReady()
  }

  private func setup() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(phoneDidTapped))
    phoneNumberLabel.isUserInteractionEnabled = true
    phoneNumberLabel.addGestureRecognizer(tapGesture)
  }

  func show(profileInformation: ProfileInformation) {
    nameLabel.text = profileInformation.contactData.name
    phoneNumberLabel.text = profileInformation.contactData.phoneNumber
    mailLabel.text = profileInformation.contactData.mail
    summaryTextView.text = profileInformation.summary
    presenter?.fetchImage(named: profileInformation.imageURLString)
  }

  func show(imageData: Data?) {

    let profileImage: UIImage?
    if let dataNotNil = imageData {
      profileImage = UIImage(data: dataNotNil)
    } else {
      profileImage = nil
    }
    profileImageView.image = profileImage
  }

  @IBAction func mailDidTapped() {
    presenter?.sendMail()
  }

  @IBAction func phoneDidTapped() {
    presenter?.callMe()
  }

  func buildCall(to phoneNumber: String) {
    guard let number = URL(string: "tel://" + phoneNumber) else { return }
    UIApplication.shared.open(number, options: [:], completionHandler: nil)
  }

  func buildMail(to address: String) {
    if MFMailComposeViewController.canSendMail() {
      let mail = MFMailComposeViewController()
      mail.mailComposeDelegate = self
      mail.setToRecipients([address])
      mail.setSubject("Profile")
      mail.setMessageBody("<b>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</b>", isHTML: true)
      present(mail, animated: true, completion: nil)
    } else {
      show(error: "Cannot send mail")
    }
  }

}

extension ProfileViewController: MFMailComposeViewControllerDelegate {
  func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    switch result.rawValue {
    case MFMailComposeResult.cancelled.rawValue:
      print("Cancelled")
    case MFMailComposeResult.saved.rawValue:
      print("Saved")
    case MFMailComposeResult.sent.rawValue:
      print("Sent")
    case MFMailComposeResult.failed.rawValue:
      print("Error: \(String(describing: error?.localizedDescription))")
    default:
      break
    }
    controller.dismiss(animated: true, completion: nil)
  }
}
