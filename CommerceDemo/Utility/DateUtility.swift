//
//  DateUtility.swift
//  CommerceDemo
//
//  Created by Jignesh on 28/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import Foundation

class DateUtility {
    
    static let DATE_FORMAT_T_Z = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    static let DD_MMM_YYYY = "dd MMM yyyy"
    
    static func convertStringToTimeStamp(dateString: String?, currentFormat: String, isForUTC : Bool = true) -> Double {
        
        if let strDate = dateString{
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = currentFormat //Your date format
            dateFormatter.calendar = Calendar.current
            if isForUTC{
                dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            }else{
                dateFormatter.timeZone = NSTimeZone.local
            }
            if let date = dateFormatter.date(from: strDate){
                return date.timeIntervalSince1970
            }
        }
        return 0
    }
    
    
    static func convertTimeStampToDesiredFormat(timestamp: Double, dateFormat: String, isForUTC : Bool = false) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale.current
        if isForUTC{
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        }else{
            dateFormatter.timeZone = NSTimeZone.local
        }
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: date)
    }
}
