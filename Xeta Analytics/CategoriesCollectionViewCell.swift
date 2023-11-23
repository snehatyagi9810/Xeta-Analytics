//
//  CategoriesCollectionViewCell.swift
//  Xeta Analytics
//
//  Created by Sneh on 21/11/23.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var exerciseCategoryLabel: UILabel!
    
    @IBOutlet weak var numberOfExerciseLabel: UILabel!
    
    @IBOutlet weak var exerciseCategoryImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 10
    }

    func configureCell(category: Category?){
        exerciseCategoryLabel.text = category?.category_name
        numberOfExerciseLabel.text = "\(category?.no_of_exercises ?? "0") Exercise"
    }
}
