//
//  TrackerCollectionViewCell.swift
//  Xeta Analytics
//
//  Created by Sneh on 18/11/23.
//

import UIKit

class TrackerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var accuracyProgressLabel: UILabel!
    
    @IBOutlet weak var workoutDurationProgress: UILabel!
    
    
    @IBOutlet weak var caloriesBurnProgress: UILabel!
    @IBOutlet weak var repsProgressLabel: UILabel!
    
    @IBOutlet weak var imageBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageBackgroundView.layer.cornerRadius = imageBackgroundView.bounds.width / 2
        self.layer.cornerRadius = 10
    }

}
