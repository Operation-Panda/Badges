//
//  ContentView.swift
//  Badges
//
//  Created by Roaa on 2/22/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = BadgeViewModel()
        
    var body: some View {
        ScrollView {
            VStack {
                Button("Achieve A Random Challenge") {
                    let randomChallenge = viewModel.challenges.filter {$0.stillAChallenge} .randomElement()
                    if let RC = randomChallenge {
                        viewModel.challengeIsAchieved(CB: RC)
                    }
                }
                
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
                                ForEach(viewModel.achievements) { achievement in
                                    if achievement.stillAnAchievement {
                                        Image(achievement.completeImageName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .shadow(radius: 8)
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
                                ForEach(viewModel.challenges) { challenge in
                                    if challenge.stillAChallenge {
                                        Image(challenge.completeImageName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .shadow(radius: 8)
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


//Button {
//    withAnimation {
//        degrees = (degrees == .zero) ? 360 : .zero
//    }
//} label: {
//   Image("JanuaryAchievement")
//       .resizable()
//       .aspectRatio(contentMode: .fit)
//       .shadow(radius: 8)
//       .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0))
//}
