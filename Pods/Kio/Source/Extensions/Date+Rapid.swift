//
//  Rapid
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//
import Foundation

/**
 A DSL for Date to access custom methods
*/
public struct RapidDateDSL {

    // MARK: Static Properties
    /**
     UTC TimeZone instance
    */
    public static let timeZone: TimeZone = TimeZone(identifier: "UTC")!

    /**
     Calendar Instance.

     firstWeekday is 1 aka Sunday

     timeZone is UTC
    */
    public static let calendar: Calendar = {
        var calendar: Calendar = Calendar.autoupdatingCurrent
        calendar.firstWeekday = 1
        calendar.timeZone = RapidDateDSL.timeZone
        return calendar
    }()

    // MARK: Enum
    public enum Weekdays: Int {
        /**
         Sunday
        */
        case sunday = 1
        /**
         Monday
        */
        case monday = 2
        /**
         Tuesday
        */
        case tuesday = 3
        /**
         Wednesday
        */
        case wednesday = 4
        /**
         Thursday
        */
        case thursday = 5
        /**
         Friday
        */
        case friday = 6
        /**
         Saturday
        */
        case saturday = 7
    }

    // MARK: Stored Propeties
    /**
     Underlying Date instance
    */
    let date: Date

}

public extension RapidDateDSL {
    /**
     Returns the 0:00 Date of the underlying Date. In UTC TimeZone.
    */
    var startOfDay: Date {
        return RapidDateDSL.calendar.startOfDay(for: self.date)
    }

    /**
     Returns the 23:59 Date of the underlying Date. In UTC TimezZone
    */
    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return RapidDateDSL.calendar.date(byAdding: components, to: self.startOfDay)!
    }

    /**
     Gets the date of the past weekday based on the underlying date. If the weekday is the same as the date, then the
     same date is returned with a midnight time.
     - parameter weekday: The weekday of the date that will be returned
    */
    func date(ofPastWeekday weekday: RapidDateDSL.Weekdays) -> Date {
        var calendar: Calendar = Calendar.autoupdatingCurrent
        calendar.firstWeekday = weekday.rawValue
        calendar.timeZone = RapidDateDSL.timeZone

        let currentDateComponents: DateComponents = calendar.dateComponents(
            [Calendar.Component.yearForWeekOfYear, Calendar.Component.weekOfYear],
            from: self.date
        )

        return calendar.date(from: currentDateComponents)!
    }
}

public extension Date {
    /**
     RapidDateDSL instance to access custom methods
    */
    var rpd: RapidDateDSL {
        return RapidDateDSL(date: self)
    }
}
