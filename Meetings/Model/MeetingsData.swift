//
//  MeetingsData.swift
//  Meetings
//
//  Created by Aakash Sinha on 14/06/20.
//  Copyright © 2020 Aakash Sinha. All rights reserved.
//

import Foundation




struct MeetingsData : Codable {
    let startTime: String
    let endTime : String
    let description : String
    
    
    enum CodingKeys: String, CodingKey {
        case startTime = "start_time"
        case endTime = "end_time"
        case description = "description"
        
    }
    
    init(from decoder : Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        startTime = try values.decode(String.self , forKey: .startTime)
        endTime = try values.decode(String.self , forKey: .endTime)
        description = try values.decode(String.self , forKey: .description)
        
    }
}

struct List: Codable {
    var lists: [MeetingsData]
}

