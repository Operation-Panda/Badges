//
//  BadgeStruct.swift
//  Badges
//
//  Created by Roaa on 2/25/24.
//

import Foundation

struct ChallengeBadge: Identifiable, Equatable {
    let id = UUID()
    var stillAChallenge = true
    let imageName: String
    var completeImageName: String {
        imageName + "Challenge"
    }
    var degrees = Double.zero
}

struct AchievementBadge: Identifiable, Equatable {
    let id = UUID()
    var stillAnAchievement = false
    let imageName: String
    var completeImageName: String {
        imageName + "Achievement"
    }
    var degrees = Double.zero
}
