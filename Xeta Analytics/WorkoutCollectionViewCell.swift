//
//  WorkoutCollectionViewCell.swift
//  Xeta Analytics
//
//  Created by Sneh on 18/11/23.
//

import UIKit

class WorkoutCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var mainButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainButton.layer.cornerRadius = mainButton.bounds.height / 2
        self.layer.cornerRadius = 10
        progressView.layer.cornerRadius = 6
        progressView.clipsToBounds = true
        progressView.layer.sublayers![1].cornerRadius = 6
        progressView.subviews[1].clipsToBounds = true
    
    }

    @IBAction func mainButtonPressed(_ sender: UIButton) {
    }
    
}
