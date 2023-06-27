//
//  FootballAPI.swift
//  Football AR
//
//  Created by ARTEM on 24.06.2023.
//

private extension URLSession {
    func synchronousDataTask(urlrequest: URLRequest) -> (data: Data?, response: URLResponse?, error: Error?) {
        var data: Data?
        var response: URLResponse?
        var error: Error?
        let group = DispatchGroup()
        group.enter()
        
        let dataTask = self.dataTask(with: urlrequest) { taskData, taskResponse, taskError in
            data = taskData
            response = taskResponse
            error = taskError
            group.leave()
        }
        
        dataTask.resume()
        group.wait()

        return (data, response, error)
    }
}

import Foundation

class FootballAPI {
    
    public func getClubInfo(clubID: String) -> Club?{
           
            var club: Club?
           guard let commentUrl = URL(string: "https://api.football-data.org/v4/teams/\(clubID)") else{return nil}
           var request = URLRequest(url: commentUrl)
           request.addValue("58457d5517fd4fbaa47c205a6b558417", forHTTPHeaderField: "X-Auth-Token")
           
           let (data,_,_) = URLSession.shared.synchronousDataTask(urlrequest: request)

       
           guard let data = data else {
               return nil}
           let decoder = JSONDecoder()
           
           
           do {
               let optClub = try decoder.decode(Club?.self, from: data)
               guard let tempClub = optClub else{return nil}
               club = tempClub
               return club
               
           } catch {
               print(error.localizedDescription)
               debugPrint(error)
           }
           
           return club
       }
}


struct Club: Codable{
    var crest: String
    var address: String
    var website: String
    var runningCompetitions: [RunCompetitions]
    var coach: Coach?
    var squad: [Squad]
}
struct Coach: Codable{
    var id: Int?
    var name: String?
    var nationality: String?
}
struct Squad: Codable{
    var id: Int
    var name: String
    var position: String
    var nationality: String
}
struct Contract: Codable{
    var start: String
    var until: String
}

struct RunCompetitions: Codable{
    var id: Int
    var name: String
    var emblem: String?
}
//id ELC 2072
