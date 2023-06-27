//
//  TeamView.swift
//  Football AR
//
//  Created by ARTEM on 25.06.2023.
//

import SwiftUI

struct TeamView: View {
    let coach: Coach?
    let squad: [Squad]
    var body: some View {
        VStack{
            if let coach = self.coach, let coachName = coach.name, let coachNat = coach.nationality{
                VStack{
                    HStack{
                        Text("Coach")
                            .font(.system(size: 21, weight: .medium))
                        Spacer()
                    }
                    HStack{
                        Text(coachName)
                            .font(.system(size: 18))
                        Text(getCountryFlag(name:coachNat))
                            .font(.system(size: 26))
                        Spacer()
                    }
                    .padding(.top, 1)
                }
                .padding(.leading, 20)
            }
            if !squad.isEmpty{
                VStack{
                    HStack{
                        Text("Players")
                            .font(.system(size: 21, weight: .medium))
                        Spacer()
                    }
                    .padding(.top, 1)
                    ForEach(squad, id: \.id) { squad in
                        HStack{
                            Text(squad.name)
                                .font(.system(size: 18))
                            Text(getCountryFlag(name:squad.nationality))
                                .font(.system(size: 26))
                            Spacer()
                            Text(squad.position)
                                .padding(.trailing, 20)
                                .font(.system(size: 18, weight: .thin))
                        }
                    }
                    .padding(.top, 1)
                }
                .padding(.leading, 20)
            }
            Spacer()
        }
    }
    func getCountryFlag(name: String) -> String{
        if(name == "England"){
            return "🏴󠁧󠁢󠁥󠁮󠁧󠁿"
        }
        if(name == "Czech Republic"){
            return "🇨🇿"
        }
        if(name == "Scotland"){
            return "🏴󠁧󠁢󠁳󠁣󠁴󠁿"
        }
        if(name == "Bosnia-Herzegovina"){
            return "🇧🇦"
        }
        if(name == "Northern Ireland"){
            return "🇯🇪"
        }
        if(name == "Wales"){
            return "🏴󠁧󠁢󠁷󠁬󠁳󠁿"
        }
        if(name == "DR Congo"){
            return "🇨🇩"
        }
        if(name == "USA"){
            return "🇺🇸"
        }
        if(name == "Cote d\'Ivoire"){
            return "🇨🇮"
        }
        return countryFlagFromCode(countryCode: countryCode(from: name) ?? "")
    }
    func countryCode(from countryName: String) -> String? {
        return NSLocale.isoCountryCodes.first { (code) -> Bool in
            let name = NSLocale.current.localizedString(forRegionCode: code)
            return name == countryName
        }
    }
    func countryFlagFromCode(countryCode: String) -> String {
      return String(String.UnicodeScalarView(
         countryCode.unicodeScalars.compactMap(
           { UnicodeScalar(127397 + $0.value) })))
    }
}
