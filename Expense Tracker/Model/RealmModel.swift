//
//  RealmModel.swift
//  Expense Tracker
//
//  Created by Erkan on 6.05.2023.
//

import Foundation
import RealmSwift


class Tracker: Object{
    
    
    @objc dynamic var accountName: String = ""
    @objc dynamic var categoryName: String = ""
    @objc dynamic var trackerNote: String = ""
    @objc dynamic var currentTotalMoney: Float = 0
    @objc dynamic var categoryEachMoney: Float = 0
    @objc dynamic var id = 0
    

    
    
    
}




