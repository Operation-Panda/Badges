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
            ChallengeBadge(badgeType: .month, rewardType: .assignment, imageName: "January"),
            ChallengeBadge(badgeType: .month, rewardType: .assignment, imageName: "February"),
            ChallengeBadge(badgeType: .month, rewardType: .assignment, imageName: "March"),
            ChallengeBadge(badgeType: .month, rewardType: .assignment, imageName: "April"),
            ChallengeBadge(badgeType: .month, rewardType: .assignment, imageName: "May"),
            ChallengeBadge(badgeType: .month, rewardType: .assignment, imageName: "June"),
            ChallengeBadge(badgeType: .month, rewardType: .assignment, imageName: "July"),
            ChallengeBadge(badgeType: .month, rewardType: .assignment, imageName: "August"),
            ChallengeBadge(badgeType: .month, rewardType: .assignment, imageName: "September"),
            ChallengeBadge(badgeType: .month, rewardType: .assignment, imageName: "October"),
            ChallengeBadge(badgeType: .month, rewardType: .assignment, imageName: "November"),
            ChallengeBadge(badgeType: .month, rewardType: .assignment, imageName: "December"),
            ChallengeBadge(badgeType: .special, rewardType: .assignment, imageName: "firstAssignmentAdded"),
            ChallengeBadge(badgeType: .special, rewardType: .event, imageName: "firstEventAdded"),
            ChallengeBadge(badgeType: .special, rewardType: .assignment, imageName: "firstAssignmentCompleted"),
            ChallengeBadge(badgeType: .special, rewardType: .event, imageName: "firstEventCompleted"),
            ChallengeBadge(badgeType: .special, rewardType: .assignment, imageName: "10AssignmentsCompleted"),
            ChallengeBadge(badgeType: .special, rewardType: .event, imageName: "10EventsCompleted"),
            ChallengeBadge(badgeType: .special, rewardType: .assignment, imageName: "25AssignmentsCompleted"),
            ChallengeBadge(badgeType: .special, rewardType: .event, imageName: "25EventsCompleted"),
            ChallengeBadge(badgeType: .special, rewardType: .assignment, imageName: "50AssignmentsCompleted"),
            ChallengeBadge(badgeType: .special, rewardType: .event, imageName: "50EventsCompleted"),
            ChallengeBadge(badgeType: .special, rewardType: .assignment, imageName: "75AssignmentsCompleted"),
            ChallengeBadge(badgeType: .special, rewardType: .event, imageName: "75EventsCompleted"),
            ChallengeBadge(badgeType: .special, rewardType: .assignment, imageName: "100AssignmentsCompleted"),
            ChallengeBadge(badgeType: .special, rewardType: .event, imageName: "100EventsCompleted")
        ]
        
        self.achievements = [
            AchievementBadge(badgeType: .month, rewardType: .assignment, imageName: "January"),
            AchievementBadge(badgeType: .month, rewardType: .assignment, imageName: "February"),
            AchievementBadge(badgeType: .month, rewardType: .assignment, imageName: "March"),
            AchievementBadge(badgeType: .month, rewardType: .assignment, imageName: "April"),
            AchievementBadge(badgeType: .month, rewardType: .assignment, imageName: "May"),
            AchievementBadge(badgeType: .month, rewardType: .assignment, imageName: "June"),
            AchievementBadge(badgeType: .month, rewardType: .assignment, imageName: "July"),
            AchievementBadge(badgeType: .month, rewardType: .assignment, imageName: "August"),
            AchievementBadge(badgeType: .month, rewardType: .assignment, imageName: "September"),
            AchievementBadge(badgeType: .month, rewardType: .assignment, imageName: "October"),
            AchievementBadge(badgeType: .month, rewardType: .assignment, imageName: "November"),
            AchievementBadge(badgeType: .month, rewardType: .assignment, imageName: "December"),
            AchievementBadge(badgeType: .special, rewardType: .assignment, imageName: "firstAssignmentAdded"),
            AchievementBadge(badgeType: .special, rewardType: .event, imageName: "firstEventAdded"),
            AchievementBadge(badgeType: .special, rewardType: .assignment, imageName: "firstAssignmentCompleted"),
            AchievementBadge(badgeType: .special, rewardType: .event, imageName: "firstEventCompleted"),
            AchievementBadge(badgeType: .special, rewardType: .assignment, imageName: "10AssignmentsCompleted"),
            AchievementBadge(badgeType: .special, rewardType: .event, imageName: "10EventsCompleted"),
            AchievementBadge(badgeType: .special, rewardType: .assignment, imageName: "25AssignmentsCompleted"),
            AchievementBadge(badgeType: .special, rewardType: .event, imageName: "25EventsCompleted"),
            AchievementBadge(badgeType: .special, rewardType: .assignment, imageName: "50AssignmentsCompleted"),
            AchievementBadge(badgeType: .special, rewardType: .event, imageName: "50EventsCompleted"),
            AchievementBadge(badgeType: .special, rewardType: .assignment, imageName: "75AssignmentsCompleted"),
            AchievementBadge(badgeType: .special, rewardType: .event, imageName: "75EventsCompleted"),
            AchievementBadge(badgeType: .special, rewardType: .assignment, imageName: "100AssignmentsCompleted"),
            AchievementBadge(badgeType: .special, rewardType: .event, imageName: "100EventsCompleted")
        ]
    }
    
    func achieveByImageName(name: String) {
        for index in challenges.indices {
            if challenges[index].imageName == name {
                challengeIsAchieved(CB: challenges[index])
            }
        }
    }
    
    func challengeIsAchieved(CB: ChallengeBadge) {
        let index = challenges.firstIndex(of: CB)!
        challenges[index].stillAChallenge = false
        achievements[index].stillAnAchievement = true
    }
    
    func achievementIsUnAchieved(AB: AchievementBadge) {
        let index = achievements.firstIndex(of: AB)!
        challenges[index].stillAChallenge = true
        achievements[index].stillAnAchievement = false
    }
    
}
