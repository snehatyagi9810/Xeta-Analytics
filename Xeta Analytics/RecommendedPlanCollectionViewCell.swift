//
//  RecommendedPlanCollectionViewCell.swift
//  Xeta Analytics
//
//  Created by Sneh on 21/11/23.
//

import UIKit

class RecommendedPlanCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var exerciseName: UILabel!
    
    @IBOutlet weak var exerciseDifficultyLevel: UILabel!
    
    @IBOutlet weak var armImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 10
    }
    
    func configureCell(plan: Plan?){
        exerciseName.text = plan?.plan_name
        exerciseDifficultyLevel.text = plan?.difficulty
    }

}
