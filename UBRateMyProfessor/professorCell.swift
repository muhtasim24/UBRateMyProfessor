//
//  professorCell.swift
//  UBRateMyProfessor
//
//  Created by Joe Maiarana on 4/13/22.
//

import UIKit

class professorCell: UITableViewCell {

    @IBOutlet weak var professorName: UILabel!
    @IBOutlet weak var overallrating: UILabel!
    @IBOutlet weak var difficultyRating: UILabel!
    @IBOutlet weak var subjectsList: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
