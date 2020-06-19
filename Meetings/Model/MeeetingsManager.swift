//
//  MeeetingsManager.swift
//  Meetings
//
//  Created by Aakash Sinha on 14/06/20.
//  Copyright © 2020 Aakash Sinha. All rights reserved.
//

import Foundation

protocol MeetingsManagerDelegate {
    func didUpdateMeetings(_ meetingsManager: MeetingsManager, meetings: MeetingsModel)
    func didFailWithError(error: Error)
}


struct MeetingsManager {
    let meetingsURL = "https://fathomless-shelf-5846.herokuapp.com/api/schedule?"
    
    
    var delegate: MeetingsManagerDelegate?
    
    
    
    func fetchMeetingsList(with dateString : String) {
       
        let urlString = "\(meetingsURL)&date=\(dateString)"
        print(urlString)
        
        performRequest(with: urlString)
        
    }
    
    
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let meeting = self.parseJSON(safeData) {
                        
                        self.delegate?.didUpdateMeetings(self, meetings : meeting)
                    }
                }
            }
            task.resume()
        }
        
    }
    
    
    func parseJSON(_ meetingsData: Data) -> MeetingsModel? {
        
        var startTimeArray = [String]()
        var endTimeArray = [String]()
        var descriptionArray = [String]()
        
        
        let decoder = JSONDecoder()
        
        
        do {
            let decodedData = try decoder.decode([MeetingsData].self, from: meetingsData)
            
            for data in decodedData {
                startTimeArray.append(data.startTime)
                endTimeArray.append(data.endTime)
                descriptionArray.append(data.description)
            }
            
            
            
            
            let meetings = MeetingsModel(startTime: startTimeArray, endTime: endTimeArray, descriptionMeeting: descriptionArray)
            
            return meetings
            
            
            
        } catch {
            delegate?.didFailWithError(error: error)
            
            return nil
        }
    }
    
}


