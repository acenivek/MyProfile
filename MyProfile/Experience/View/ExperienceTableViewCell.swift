//
//  ExperienceTableViewCell.swift
//  
//
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {

  @IBOutlet weak var companyImage: UIImageView!
  @IBOutlet weak var companyName: UILabel!
  @IBOutlet weak var companyDate: UILabel!
  @IBOutlet weak var companyPosition: UILabel!
  @IBOutlet weak var companyResponsabilities: UILabel!
  @IBOutlet weak var companyAchivements: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
