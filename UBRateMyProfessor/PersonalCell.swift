//
//  PersonalCell.swift
//  UBRateMyProfessor
//
//  Created by Joe Maiarana on 4/27/22.
//

import UIKit

class PersonalCell: UITableViewCell {

    @IBOutlet weak var postQual: UILabel!
    @IBOutlet weak var postDif: UILabel!
    @IBOutlet weak var review: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
