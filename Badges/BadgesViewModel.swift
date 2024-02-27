//
//  BadgesViewModel.swift
//  Badges
//
//  Created by Roaa on 2/25/24.
//

import Foundation

class BadgeViewModel: ObservableObject {
    @Published var challenges: [ChallengeBadge]
    @Published var achievements: [AchievementBadge]
    
    init() {
        self.challenges = [
            ChallengeBadge(imageName: "January"), 
            ChallengeBadge(imageName: "February"),
            ChallengeBadge(imageName: "March"),
            ChallengeBadge(imageName: "April"),
            ChallengeBadge(imageName: "May"),
            ChallengeBadge(imageName: "June"),
            ChallengeBadge(imageName: "July"),
            ChallengeBadge(imageName: "August"),
            ChallengeBadge(imageName: "September"),
            ChallengeBadge(imageName: "October"),
            ChallengeBadge(imageName: "November"),
            ChallengeBadge(imageName: "December"),
            ChallengeBadge(imageName: "firstAssignmentAdded"),
            ChallengeBadge(imageName: "firstEventAdded"),
            ChallengeBadge(imageName: "firstAssignmentCompleted"),
            ChallengeBadge(imageName: "firstEventCompleted"),
            ChallengeBadge(imageName: "10AssignmentsCompleted"),
            ChallengeBadge(imageName: "10EventsCompleted"),
            ChallengeBadge(imageName: "25EventsCompleted"),
            ChallengeBadge(imageName: "25AssignmentsCompleted"),
            ChallengeBadge(imageName: "50EventsCompleted"),
            ChallengeBadge(imageName: "50AssignmentsCompleted"),
            ChallengeBadge(imageName: "75EventsCompleted"),
            ChallengeBadge(imageName: "75AssignmentsCompleted"),
            ChallengeBadge(imageName: "100AssignmentsCompleted"),
            ChallengeBadge(imageName: "100EventsCompleted")
        ]
        
        self.achievements = [
            AchievementBadge(imageName: "January"),
            AchievementBadge(imageName: "February"),
            AchievementBadge(imageName: "March"),
            AchievementBadge(imageName: "April"),
            AchievementBadge(imageName: "May"),
            AchievementBadge(imageName: "June"),
            AchievementBadge(imageName: "July"),
            AchievementBadge(imageName: "August"),
            AchievementBadge(imageName: "September"),
            AchievementBadge(imageName: "October"),
            AchievementBadge(imageName: "November"),
            AchievementBadge(imageName: "December"),            
            AchievementBadge(imageName: "firstAssignmentAdded"),
            AchievementBadge(imageName: "firstEventAdded"),
            AchievementBadge(imageName: "firstAssignmentCompleted"),
            AchievementBadge(imageName: "firstEventCompleted"),
            AchievementBadge(imageName: "10AssignmentsCompleted"),
            AchievementBadge(imageName: "10EventsCompleted"),
            AchievementBadge(imageName: "25EventsCompleted"),
            AchievementBadge(imageName: "25AssignmentsCompleted"),
            AchievementBadge(imageName: "50EventsCompleted"),
            AchievementBadge(imageName: "50AssignmentsCompleted"),
            AchievementBadge(imageName: "75EventsCompleted"),
            AchievementBadge(imageName: "75AssignmentsCompleted"),
            AchievementBadge(imageName: "100AssignmentsCompleted"),
            AchievementBadge(imageName: "100EventsCompleted")
        ]
    }
    
    func addAchievement(imageName: String) {
        achievements.append(contentsOf: [
            AchievementBadge(imageName: imageName)
        ])
    }
    
    func addChallenge(imageName: String) {
        challenges.append(contentsOf: [
            ChallengeBadge(imageName: imageName)
        ])
    }
    
    func challengeIsAchieved(CB: ChallengeBadge) {
        let index = challenges.firstIndex(of: CB)!
        challenges[index].stillAChallenge = false
        achievements[index].stillAnAchievement = true
    }
    
}
