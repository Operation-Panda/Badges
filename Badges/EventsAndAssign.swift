//
//  EventsAndAssign.swift
//  Badges
//
//  Created by Roaa on 2/26/24.
//

import Foundation

struct Event {
    static var eventCount = 0
    
    static func increaseEventCount() {
        defer { eventCount += 1 }
        Event.eventCount = eventCount
    }
}

struct Assignment {
    static var assignCount = 0
    
    static func increaseAssignCount() {
        defer { assignCount += 1 }
        Assignment.assignCount = assignCount
    }
}

class EventsAndAssignViewModel: ObservableObject {
    @Published var monthToEventCount = [
        "January" : 0,
        "February" : 0,
        "March" : 0,
        "April" : 0,
        "May" : 0,
        "June" : 0,
        "July" : 0,
        "August" : 0,
        "September" : 0,
        "October" : 0,
        "November" : 0,
        "December" : 0
    ]
    
    @Published var monthToAssignCount =  [
        "January" : 0,
        "February" : 0,
        "March" : 0,
        "April" : 0,
        "May" : 0,
        "June" : 0,
        "July" : 0,
        "August" : 0,
        "September" : 0,
        "October" : 0,
        "November" : 0,
        "December" : 0
    ]
    
    func addNewEvent() {
        Event.increaseEventCount()
    }
    
    func addNewAssignment() {
        Assignment.increaseAssignCount()
    }
    
    func resetEventCount() {
        Event.eventCount = 0
    }
    
    func resetAssignCount() {
        Assignment.assignCount = 0
    }
    
    func addAssignForSpecificMonth(month: String) {
        addNewAssignment()
        monthToAssignCount[month]! += 1
    }
    
    func removeAssignForSpecificMonth(month: String) {
        monthToAssignCount[month]! = 0
    }
    
    func removeEventsForSpecificMonth(month: String) {
        monthToAssignCount[month]! = 0
    }
    
    func checkIfMonthHasTenAssignments(month: String) -> Bool {
        return monthToAssignCount[month]! >= 10
    }
    
    func checkIfEventCountGreaterThanGivenNumber(num: Int) -> Bool {
        return Event.eventCount >= num
    }
    
    func checkIfAssignmentCountGreaterThanGivenNumber(num: Int) -> Bool {
        return Assignment.assignCount >= num
    }
    
}


