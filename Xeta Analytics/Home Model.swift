//
//  Home Model.swift
//  Xeta Analytics
//
//  Created by Sneh on 21/11/23.
//

import Foundation

struct HomeModel: Decodable {
    var success: Bool
    var data: Datum
}
struct Datum: Decodable {
    var section_1: Section_1
    var section_2: Section_2
    var section_3: Section_3
    var section_4: Section_4
}
struct Section_1: Decodable{
    var plan_name: String
    var progress: String
}

struct Section_2: Decodable{
    var accuracy: String
    var workout_duration: String
    var reps: Int
    var calories_burned:Int
}

struct Section_3: Decodable{
    var plan_1: Plan
    var plan_2: Plan
}

struct Plan: Decodable{
    var plan_name: String
    var difficulty: String
}

struct Section_4: Decodable{
    var category_1: Category
    var category_2:Category
}

struct Category: Decodable{
    var category_name: String
    var no_of_exercises: String
}

