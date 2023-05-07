//
//  TrackerDAO.swift
//  Expense Tracker
//
//  Created by Erkan on 6.05.2023.
//

import Foundation
import RealmSwift


class TrackerDAO{
    
    var realm: Realm = try! Realm()
    
    
    func saveTrackers(_ tracker: Tracker){
        
        try! realm.write({
            realm.add(tracker)
        })
        
    }
    
    
    func findTrackersByName(_ title: String) -> Results<Tracker>{
        let predicate = NSPredicate(format: "categoryName = %@", title)
        return realm.objects(Tracker.self).filter(predicate)
    }
    
    func addNewTracker(_ categoryName: String, accountName: String, id: Int, totalMoney: Float, categoryMoney: Float, trackerNote: String) -> Tracker{
        let tracker = Tracker()
        tracker.categoryName = categoryName
        tracker.accountName = accountName
        tracker.id = id
        tracker.currentTotalMoney = totalMoney
        tracker.categoryEachMoney = categoryMoney
        tracker.trackerNote = trackerNote
        return tracker
    }
    
    func deleteTracker(_ tracker: Tracker){
        if(realm != nil){
            try! realm.write({
                realm.delete(tracker)
            })
        }
    }
    
}
