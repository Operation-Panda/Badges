//
//  ContentView.swift
//  Badges
//
//  Created by Roaa on 2/22/24.
//
 
import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = BadgeViewModel()
    @ObservedObject var EAVM = EventsAndAssignViewModel()
    
    @State var selectedMonth = "January"
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) { 
                
                HStack {
                    Picker("Please choose a month", selection: $selectedMonth) {
                        ForEach(months, id: \.self) {
                            Text($0)
                        }
                    }
                    Button("Add Assignment") {
                        EAVM.addAssignForSpecificMonth(month: selectedMonth)
                        
                        if EAVM.checkIfMonthHasTenAssignments(month: selectedMonth) {
                            viewModel.achieveByImageName(name: selectedMonth)
                        }
                        
                        switch Event.eventCount {
                            case 1: viewModel.achieveByImageName(name: "firstEventCompleted")
                            case 10: viewModel.achieveByImageName(name: "10EventsCompleted")
                            case 25: viewModel.achieveByImageName(name: "25EventsCompleted")
                            case 50: viewModel.achieveByImageName(name: "50EventsCompleted")
                            case 75: viewModel.achieveByImageName(name: "75EventsCompleted")
                            case 100: viewModel.achieveByImageName(name: "100EventsCompleted")
                            default: break
                        }
                      
                        switch Assignment.assignCount {
                            case 1: viewModel.achieveByImageName(name: "firstAssignmentCompleted")
                            case 10: viewModel.achieveByImageName(name: "10AssignmentsCompleted")
                            case 25: viewModel.achieveByImageName(name: "25AssignmentsCompleted")
                            case 50: viewModel.achieveByImageName(name: "50AssignmentsCompleted")
                            case 75: viewModel.achieveByImageName(name: "75AssignmentsCompleted")
                            case 100: viewModel.achieveByImageName(name: "100AssignmentsCompleted")
                            default: break
                        }
                    
                    }
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(Color("Navy"))
                .bold()
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                    .fill(Color("LightGrayColor"))
                    .stroke(.black)
                )
                .padding(.vertical)
                
                
                Button {
                    let randomChallenge = viewModel.challenges.filter {$0.stillAChallenge}.randomElement()
                    
                    if let RC = randomChallenge {
                        viewModel.challengeIsAchieved(CB: RC)
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("LightGrayColor"))
                            .stroke(.black) 
                        Text("Achieve A Random Challenge")
                            .foregroundColor(Color("Navy"))
                            .bold()
                            .padding()
                    }
                }
                .padding(.vertical)
                
                Button {
                    let randomAchievement = viewModel.achievements.filter {$0.stillAnAchievement}.randomElement()
                    if let RA = randomAchievement {
                        viewModel.achievementIsUnAchieved(AB: RA)
                        if RA.badgeType == .month {
                            EAVM.removeAssignForSpecificMonth(month: RA.imageName)
                        } else if RA.badgeType == .special {
                            if RA.rewardType == .assignment {
                                EAVM.resetAssignCount()
                            } else {
                                EAVM.resetEventCount()
                            }
                        }
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("LightGrayColor"))
                            .stroke(.black)
                        Text("Unachieve A Random Achievement")
                            .foregroundColor(Color("Navy"))
                            .bold()
                            .padding()
                    }
                }
                .padding(.vertical)
                
                VStack(spacing: -40) {
                    ZStack {
                        Text("Achievements")
                            .font(.title2)
                            .monospaced()
                        ZStack(alignment: .topLeading) {
                            Rectangle()
                                .fill(Color("Navy"))
                                .frame(width: 40, height: 40)
                            Rectangle()
                                .stroke(.black, lineWidth: 2)
                                .frame(height: 40)
                        }
                    }
                    
                    HStack {
                        Rectangle()
                            .stroke(.black, lineWidth: 2)
                            .frame(width: 40)
                        VStack {
                            Rectangle()
                                .frame(height: 40)
                                .opacity(0)
                            
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 20) {
                                ForEach(viewModel.achievements.indices, id: \.self) { index in
                                    if viewModel.achievements[index].stillAnAchievement {
                                        Button {
                                            withAnimation {
                                                viewModel.achievements[index].degrees = (viewModel.achievements[index].degrees == .zero) ? 360 : .zero
                                            }
                                        } label: {
                                            Image(viewModel.achievements[index].completeImageName)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .shadow(radius: 8)
                                                .rotation3DEffect(.degrees(viewModel.achievements[index].degrees), axis: (x: 0, y: 1, z: 0))
                                        }
                                    }
                                }
                            }
                        } 
                    }
                }
                .background(Color("LightGrayColor")).border(.black)
                .padding(.vertical)
                
                VStack(spacing: -40) {
                    ZStack {
                        Text("Challenges")
                            .font(.title2)
                            .monospaced()
                        ZStack(alignment: .topLeading) {
                            Rectangle()
                                .fill(Color("Steel"))
                                .frame(width: 40, height: 40)
                            Rectangle()
                                .stroke(.black, lineWidth: 2)
                                .frame(height: 40)
                        }
                    }
                    
                    HStack {
                        Rectangle()
                            .stroke(.black, lineWidth: 2)
                            .frame(width: 40)
                        VStack {
                            Rectangle()
                                .frame(height: 40)
                                .opacity(0)
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 20) {
                                ForEach(viewModel.challenges.indices, id: \.self) { index in
                                    if viewModel.challenges[index].stillAChallenge {
                                        Button {
                                            withAnimation {
                                                viewModel.challenges[index].degrees = (viewModel.challenges[index].degrees == .zero) ? 360 : .zero
                                            }
                                        } label: {
                                            Image(viewModel.challenges[index].completeImageName)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .shadow(radius: 8)
                                                .rotation3DEffect(.degrees(viewModel.challenges[index].degrees), axis: (x: 0, y: 1, z: 0))
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .background(Color("LightGrayColor")).border(.black)
                .padding(.vertical)
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

