//
//  RunningCompetition.swift
//  Football AR
//
//  Created by ARTEM on 25.06.2023.
//

import SwiftUI

import SwiftUI

struct RunningCompetition: View {
    let competititons: [RunCompetitions]
    var body: some View {
        VStack{
            HStack{
                Text("Club competitions")
                    .font(.system(size: 21, weight: .medium))
                    Spacer()
            }
            .padding(.leading, 20)
            VStack{
                ForEach(competititons, id: \.id) { competititon in
                    HStack{
                            VStack{
                                if let emblem = competititon.emblem{
                                    AsyncImage(url: URL(string: changeSvg(emblem))){ image in
                                        image.image?
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                        
                                    }
                                    .padding(10)
                                }
                                else{
                                    Image("default_cup")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 40, height: 40)
                                        .padding(10)
                                }
                            }
                            .background(.white)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.backButtonColor, lineWidth: 4))
                            .shadow(radius: 10)
                            .frame(width: 60, height: 40)
                        
                        Text(competititon.name)
                            .font(.system(size: 20, weight: .thin))
                            .padding(.leading, 10)
                        Spacer()
                    }
                    .padding(.leading, 20)
                    .padding(.top, 20)
                }
            }
            Spacer()
        }
    }
}

struct RunningCompetition_Previews: PreviewProvider {
    static var previews: some View {
        let comp: [RunCompetitions] = [RunCompetitions(id: 9, name: "Copa Libertadores", emblem: "https://crests.football-data.org/CLI.svg"), RunCompetitions(id: 10, name: "Premier League", emblem: "https://crests.football-data.org/PL.png"), RunCompetitions(id: 11, name: "Premier League")]
        RunningCompetition(competititons: comp)
    }
}

func changeSvg(_ filename: String) -> String {
    let extensionToCheck = "svg"
    let newExtension = "png"
    if filename == "https://crests.football-data.org/397.svg"{
        return "https://upload.wikimedia.org/wikipedia/ru/thumb/2/24/FC_Brighton_%26_Hove_Albion_Logo.svg/1200px-FC_Brighton_%26_Hove_Albion_Logo.svg.png"
    }
    if filename == "https://crests.football-data.org/73.svg"{
        return "https://assets.stickpng.com/images/580b57fcd9996e24bc43c4ee.png"
    }
    if filename == "https://crests.football-data.org/76.svg"{
        return "https://upload.wikimedia.org/wikipedia/en/thumb/f/fc/Wolverhampton_Wanderers.svg/1200px-Wolverhampton_Wanderers.svg.png"
    }
    if filename.hasSuffix(extensionToCheck) {
        let index = filename.index(filename.endIndex, offsetBy: -extensionToCheck.count)
        let updatedFilename = filename[..<index] + newExtension
        return String(updatedFilename)
    } else {
        return filename
    }
}
