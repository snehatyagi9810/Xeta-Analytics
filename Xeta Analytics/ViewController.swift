//
//  ViewController.swift
//  Xeta Analytics
//
//  Created by Sneh on 18/11/23.
//

import UIKit

enum SectionType{
    case section1
    case section2
    case section3
    case section4
}
class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageView: UIImageView!
    var isDataFetched:Bool = false
    var dataModel: HomeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        setupCollectionView()
        let networkManager = NetworkManager()
        networkManager.fetchData(comp: { model in
            self.isDataFetched = true
            self.dataModel = model
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }
    
    
    func setupCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "WorkoutCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WorkoutCollectionViewCell")
        collectionView.register(UINib(nibName: "TrackerCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier:"TrackerCollectionViewCell")
        collectionView.register(UINib(nibName: "RecommendedPlanCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "RecommendedPlanCollectionViewCell")
        collectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
    }
    
    

}

extension ViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return isDataFetched ? 4: 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section <= 1 {
            return 1
        }else if  section == 2{
            return 2
        }else{
            return 2
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let workoutCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkoutCollectionViewCell", for: indexPath) as! WorkoutCollectionViewCell
        let trackerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackerCollectionViewCell", for: indexPath) as! TrackerCollectionViewCell
        let RecommendedPlanCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedPlanCollectionViewCell", for: indexPath) as! RecommendedPlanCollectionViewCell
        let categoriesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
        
        if indexPath.section == 0{
            workoutCell.progressLabel.text = dataModel?.data.section_1.progress ?? "0%"
            workoutCell.titleLabel.text = dataModel?.data.section_1.plan_name
            return workoutCell
        }else if indexPath.section == 1{
            trackerCell.accuracyProgressLabel.text = dataModel?.data.section_2.accuracy ?? "0%"
            trackerCell.workoutDurationProgress.text = dataModel?.data.section_2.workout_duration ?? "0"
            trackerCell.repsProgressLabel.text = String(dataModel?.data.section_2.reps ?? 0)
            trackerCell.caloriesBurnProgress.text = String(dataModel?.data.section_2.calories_burned ?? 0)
            return trackerCell
        }else if indexPath.section == 2{
            if indexPath.row == 0 {
                RecommendedPlanCell.configureCell(plan: dataModel?.data.section_3.plan_1)
            }else {
                RecommendedPlanCell.configureCell(plan: dataModel?.data.section_3.plan_2)
            }
            return RecommendedPlanCell
        }else{
            if indexPath.row == 0 {
                categoriesCell.configureCell(category: dataModel?.data.section_4.category_1)
            } else{
                categoriesCell.configureCell(category: dataModel?.data.section_4.category_2)
            }
            return categoriesCell
        }
    }
    
    
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            return CGSize(width: collectionView.bounds.width, height: 187)
        }else if indexPath.section == 1{
            return CGSize(width: collectionView.bounds.width, height: 145)
        }else if indexPath.section == 2{
            return CGSize(width: (collectionView.bounds.width / 2) - 6, height: 128)
        }else {
            return CGSize(width: (collectionView.bounds.width / 2) - 6, height: 94)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionReusableView", for: indexPath) as! CollectionReusableView
        if indexPath.section == 0{
            header.titleLabel.text = "Active workout plan"
            header.mainButton.isHidden = true
        }else if indexPath.section == 1{
            header.titleLabel.text = "Enhance your journey with AI tracker"
            header.mainButton.isHidden = true
        }else if indexPath.section == 2{
            header.titleLabel.text = "Recommended Plan"
            header.mainButton.isHidden = false
        }else{
            header.titleLabel.text = "Categories"
            header.mainButton.isHidden = false
        }
        return header
    }
}
