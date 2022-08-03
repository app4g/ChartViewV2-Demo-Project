//
//  FormatDisplay.swift
// Obtained from Ray Wenderlich

import Foundation

struct FormatDisplay {
  //    static func distance(_ distance: Double) -> String {
  //        let distanceMeasurement = Measurement(value: distance, unit: UnitLength.meters)
  //        return FormatDisplay.distance(distanceMeasurement)
  //    }
  //
  //    static func distance(_ distance: Measurement<UnitLength>) -> String {
  //        let formatter = MeasurementFormatter()
  //        return formatter.string(from: distance)
  //    }
  
  static func time(_ seconds: Int) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second]
    formatter.unitsStyle = .positional
    formatter.zeroFormattingBehavior = .pad
    return formatter.string(from: TimeInterval(seconds))!
  }
  
  
  static func durationFormatter(_ seconds: Int) -> String {
    let secondsComponent = seconds % 60
    let minutes = seconds / 60
    let minutesComponent = minutes % 60
    let hours = minutes / 60
    
    var formattedTimeDuration = ""
    if hours > 0 {
      formattedTimeDuration.append("\(hours):")
    }
    if minutesComponent < 10 {
      formattedTimeDuration.append("0")
    }
    formattedTimeDuration.append("\(minutesComponent):")
    
    if secondsComponent < 10 {
      formattedTimeDuration.append("0")
    }
    formattedTimeDuration.append("\(secondsComponent)")
    return formattedTimeDuration
  }
  
  static func durationFormatter_hhmmss(_ seconds: Int) -> String {
    let secondsComponent = seconds % 60
    let minutes = seconds / 60
    let minutesComponent = minutes % 60
    let hours = minutes / 60
    
    var formattedTimeDuration = ""
    
    formattedTimeDuration.append("\(hours):")
    
    if minutesComponent < 10 {
      formattedTimeDuration.append("0")
    }
    formattedTimeDuration.append("\(minutesComponent):")
    
    if secondsComponent < 10 {
      formattedTimeDuration.append("0")
    }
    formattedTimeDuration.append("\(secondsComponent)")
    return formattedTimeDuration
  }
  
  
  static func secondsTohhmm(_ seconds: Int) -> String {
    let minutes = seconds / 60
    let minutesComponent = minutes % 60
    let hours = minutes / 60
    
    var formattedTimeDuration = ""
    
    if hours > 0 {
      formattedTimeDuration.append("\(hours)h ")
    }
    
    if minutesComponent < 10 && minutesComponent > 0 {
      formattedTimeDuration.append("0")
    }
    formattedTimeDuration.append("\(minutesComponent)m")
    
    return formattedTimeDuration
  }
  
  
  static func secondsTohhmmss(_ seconds: Int) -> String {
    let secondsComponent = seconds % 60
    let minutes = seconds / 60
    let minutesComponent = minutes % 60
    let hours = minutes / 60
    
    var formattedTimeDuration = ""
    
    if hours > 0 {
      formattedTimeDuration.append("\(hours)h ")
    }
    
    if minutes > 0 {
      if minutesComponent < 10 {
        formattedTimeDuration.append("0")
      }
      formattedTimeDuration.append("\(minutesComponent)m ")
    }
    
    if secondsComponent < 10 {
      formattedTimeDuration.append("0")
    }
    formattedTimeDuration.append("\(secondsComponent)s")
    return formattedTimeDuration
  }
  
  
  static func secondsTohhmmssString(_ seconds: Int) -> String {
    let secondsComponent = seconds % 60
    let minutes = seconds / 60
    let minutesComponent = minutes % 60
    let hours = minutes / 60
    
    var formattedTimeDuration = ""
    
    if hours > 0 {
      formattedTimeDuration.append("\(hours)hours ")
    }
    
    if minutes > 0 {
      formattedTimeDuration.append("\(minutesComponent)minutes ")
    }
    
    if secondsComponent > 0 {
      formattedTimeDuration.append("\(secondsComponent)seconds")
    }
    
    return formattedTimeDuration
  }
  
  
  // Output - Sep 7, 2021
  static func date(_ timestamp: Date?) -> String {
    guard let timestamp = timestamp as Date? else { return "" }
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter.string(from: timestamp)
  }
  
  // Output Hour eg: 18 for 6pm
  static func date_local_hh(_ timestamp: Date?) -> String {
    guard let timestamp = timestamp as Date? else { return "" }
    let formatter = DateFormatter()
    formatter.dateFormat = "HH"
    return formatter.string(from: timestamp)
  }
  
  // Output +0800
  static func date_gmt_hr(_ timestamp: Date?) -> String {
    guard let timestamp = timestamp as Date? else { return "" }
    let formatter = DateFormatter()
    formatter.dateFormat = "Z"
    return formatter.string(from: timestamp)
  }
  
  // Output - 20210110-100000
  static func dateFileName(_ timestamp: Date?) -> String {
    guard let timestamp = timestamp as Date? else { return "" }
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMdd-HHmmss"
    return formatter.string(from: timestamp)
  }
  
  
  // Output 2021-01-01
  static func date_yyyymmdd(_ timestamp: Date?) -> String {
    guard let timestamp = timestamp as Date? else { return "" }
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: timestamp)
  }
  
  
  // output WWxx
  static func weekOfYear(_ timestamp: Date?) -> Int {
    guard let timestamp = timestamp as Date? else { return 1 }
    
    let calendar = Calendar(identifier: .iso8601)
    let weekOfYear = calendar.component(.weekOfYear, from: timestamp)
    
    return weekOfYear
  }
  
  //  DateFormatter().weekdaySymbols[Calendar.current.component(.weekday, from: Date()) - 1]
  
  // eg: 2022-07-07 - DayOfWeekName = Thursday, DayOfWeekIndex = 5 (Thurs = 5th Day of week)
  static func dayOfWeek(_ timestamp: Date?) -> Int {
    guard let timestamp = timestamp as Date? else { return 1 }
    print("timeStamp:\(timestamp)")
    
    let calendar = Calendar(identifier: .iso8601)
    let dayOfWeekIndex = calendar.component(.weekday, from: timestamp)
    let dayOfWeekName = DateFormatter().weekdaySymbols[Calendar.current.component(.weekday, from: Date()) - 1]
    print("dayOfWeekIndex:\(dayOfWeekIndex) dayOfWeekName:\(dayOfWeekName)")
    
    return dayOfWeekIndex
    
  }
  
  //  static func dayOfWeek2(timestamp: Date?) -> Int {
  //
  //    let calendar = Calendar(identifier: .iso8601)
  //    let dayOfWeekIndex = calendar.component(.weekday, from: timestamp!)
  //    let dayOfWeekName = DateFormatter().weekdaySymbols[Calendar.current.component(.weekday, from: Date()) - 1]
  //
  //    return dayOfWeekIndex
  //
  //  }
  
  // https://www.reddit.com/r/swift/comments/f8ai10/finding_start_and_end_of_current_week_gives_me/
  static func weekStartToDate(_ timestamp: Date?) -> Date {
    guard let timestamp = timestamp as Date? else { return Date()}
    
    let calendar = Calendar(identifier: .iso8601)
    guard let weekStartDate = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: timestamp)) else { return Date() }
    
    return weekStartDate
  }
  
  
  // https://www.reddit.com/r/swift/comments/f8ai10/finding_start_and_end_of_current_week_gives_me/
  static func weekStart(_ timestamp: Date?) -> String {
    guard let timestamp = timestamp as Date? else { return ""}
    
    let calendar = Calendar(identifier: .iso8601)
    guard let weekStartDate = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: timestamp)) else { return "" }
    
    return date_yyyymmdd(weekStartDate)
  }
  
  
  static func weekEnd(_ timestamp: Date?) -> String {
    guard let timestamp = timestamp as Date? else { return ""}
    
    let calendar = Calendar(identifier: .iso8601)
    guard let weekStartDate = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: timestamp)) else { return "" }
    let weekEndDate = calendar.date(byAdding: .day, value: 6, to: weekStartDate)
    
    return date_yyyymmdd(weekEndDate)
  }
  
  
  static func convertDateString(inputDate: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMdd-HHmmss"
    guard let oldDate = formatter.date(from: inputDate) else { return "" }
    
    /// Format to : February 8, 2021 14:29
    let newFormatter = DateFormatter()
    newFormatter.dateFormat = "MMMM d, yyyy HH:mm"
    let convertedDate = newFormatter.string(from: oldDate)
    
    return convertedDate
  }
  
  
  // returns the date eg: 1 or 11
  // https://nsdateformatter.com
  static func yyyymmdd_day(inputDate: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    guard let oldDate = formatter.date(from: inputDate) else { return "" }
    
    let newFormatter = DateFormatter()
    newFormatter.dateFormat = "d"
    let convertedDate = newFormatter.string(from: oldDate)
    
    return convertedDate
  }
  
  // returns the date eg: 01 or 11
  // https://nsdateformatter.com
  static func yyyymmdd_day0(inputDate: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    guard let oldDate = formatter.date(from: inputDate) else { return "" }
    
    let newFormatter = DateFormatter()
    newFormatter.dateFormat = "dd"
    let convertedDate = newFormatter.string(from: oldDate)
    
    return convertedDate
  }
  
  // Returns day of week as MTWTFSS
  static func yyyymmdd_ShortDay(inputDate: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    guard let oldDate = formatter.date(from: inputDate) else { return "" }
    
    
    let newFormatter = DateFormatter()
    newFormatter.dateFormat = "EEEEE"
    let convertedDate = newFormatter.string(from: oldDate)
    
    return convertedDate
  }
  
  // Returns day of week as Mon/Tue
  static func yyyymmdd_3CharDay(inputDate: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    guard let oldDate = formatter.date(from: inputDate) else { return "" }
    
    
    let newFormatter = DateFormatter()
    newFormatter.dateFormat = "E"
    let convertedDate = newFormatter.string(from: oldDate)
    
    return convertedDate
  }
  
  // Returns day of week as Monday/Tuesday etc
  static func dateToDayOfWeek(_ timestamp: Date?) -> String {
    guard let timestamp = timestamp as Date? else { return "" }
   
    let newFormatter = DateFormatter()
    newFormatter.dateFormat = "EEEE"
    let convertedDate = newFormatter.string(from: timestamp)
    
    return convertedDate
  }
  
  
  static func addingDayTo_yyyymmdd(inputDate: String, addDay: Int) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    guard var oldDate = formatter.date(from: inputDate) else { return "" }
    oldDate = Calendar.current.date(byAdding: .day, value: addDay, to: oldDate)!
    
    let newFormatter = DateFormatter()
    newFormatter.dateFormat = "yyyy-MM-dd"
    let convertedDate = newFormatter.string(from: oldDate)
    
    return convertedDate
  }
  
  
  // Format to : 2021-10-11
  // https://nsdateformatter.com
  static func yyyymmddT_yyyymmdd_String(inputDate: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    guard let oldDate = formatter.date(from: inputDate) else { return "" }
    
    let newFormatter = DateFormatter()
    newFormatter.dateFormat = "yyyy-MM-dd"
    let convertedDate = newFormatter.string(from: oldDate)
    
    return convertedDate
  }
  
  
  // Format From 2021-10-11T12:22:23 -> Oct 11
  //  https://nsdateformatter.com
  static func yyyymmddT_MMMdd_String(inputDate: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    guard let oldDate = formatter.date(from: inputDate) else { return "" }
    
    /// Format to : Oct 07
    let newFormatter = DateFormatter()
    newFormatter.dateFormat = "MMM dd"
    let convertedDate = newFormatter.string(from: oldDate)
    
    return convertedDate
  }
  
  
  // Format From 2021-10-11 -> Oct 11
  //  https://nsdateformatter.com
  static func yyyyMMdd_MMMdd_String(inputDate: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    guard let oldDate = formatter.date(from: inputDate) else { return "" }
    
    /// Format to : Oct 07
    let newFormatter = DateFormatter()
    newFormatter.dateFormat = "MMM dd"
    let convertedDate = newFormatter.string(from: oldDate)
    
    return convertedDate
  }
  
  
  static func convertDateStringOld(inputDate: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMddHHmmss"
    guard let oldDate = formatter.date(from: inputDate) else { return "" }
    
    /// Format to : February 8, 2021 14:29
    let newFormatter = DateFormatter()
    newFormatter.dateFormat = "MMMM d, yyyy HH:mm"
    let convertedDate = newFormatter.string(from: oldDate)
    
    return convertedDate
  }
  
  
  static func datems(_ timestamp: Date?) -> String {
    guard let timestamp = timestamp as Date? else { return "" }
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSS"
    return formatter.string(from: timestamp)
  }
  
  static func dateTime(_ timestamp: Date?) -> String {
    guard let timestamp = timestamp as Date? else { return "" }
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return formatter.string(from: timestamp)
  }
  
  
  static func measurementUnit() -> (distUnit: Double, distName: String, elevUnit: Double, spdUnit: Double, spdName: String, elevName: String) {
    let mUnit = 0
    let distUnit   = (mUnit == 0)   ? 1000.0 : 1609.0     // Metres in a mile
    let distName   = (mUnit == 0)   ? "km"  : "mi"        // Adjust between KM and Miles naming
    let elevUnit   = (mUnit == 0)   ? 1.0    : 3.281      // feet in a meter
    let elevName   = (mUnit == 0)   ? "m"    : "ft"       // feet in a meter
    let spdUnit    = (mUnit == 0)   ? 3.6    : 2.23694    // miles / KM per hour
    let spdName    = (mUnit == 0)   ? "kmh" : "mph"       // miles / KM per hour
    
    return (distUnit, distName, elevUnit, spdUnit, spdName, elevName)
  }
  
  
  static func distance(distance: Int) -> String {
    let mUnit = FormatDisplay.measurementUnit()
    var returnString = String()
    
    if distance < 1000 {
      if mUnit.distName == "km" {
        returnString = String(format: "%d", distance) + "m"
      } else {
        returnString =  String(format: "%.2f", Double(distance)/mUnit.distUnit) + mUnit.distName
      }
    } else {
      returnString =  String(format: "%.2f", Double(distance)/mUnit.distUnit) + mUnit.distName
    }
    return returnString
  }
  
  
  static func elevation(elev: Double) -> String {
    let mUnit = FormatDisplay.measurementUnit()
    var returnString = String()
    
    if mUnit.distName == "km" {
      returnString = String(format: "%d", Int(elev)) + mUnit.elevName
    } else {
      returnString =  String(format: "%d", Int(elev/mUnit.elevUnit)) + mUnit.elevName
    }
    return returnString
  }
  
  
  static func spdToPace(spd: Double) -> String {
    let mUnit = FormatDisplay.measurementUnit()
    var formattedSec = ""
    
    if spd > 0 {
      let paceNum = Int(mUnit.distUnit/spd)
      let minComponent = Int(paceNum / 60)
      let secComponent = paceNum % 60
      
      if secComponent < 10 {
        formattedSec.append("0")
      }
      
      formattedSec.append("\(secComponent)")
      
      let pace = String(minComponent) + ":" + String(formattedSec)
      
      return pace
    } else {
      return "---"
    }
  }
  
  
  // inputDate of form 2022-06-01 00:00:00
  // we use UTC explicitly since CloudKit dates are in UTC
  static func stringToDateUTC(inputDate: String) -> Date {
    print("inputDate:\(inputDate)")
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    let date = dateFormatter.date(from:inputDate)!
    print("outputDate:\(date)")
    
    return date
  }
  
  // inputDate of form "2022-06-01 00:00:00" or "June 2020"
  // we use UTC explicitly since CloudKit dates are in UTC
  static func monthToDate(inputDate: String) -> (sDate: Date, eDate: Date) {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MMMM yyyy"
      dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
      
      let startDate = dateFormatter.date(from: inputDate)!
      let endDate = Calendar.current.date(byAdding: .month, value: 1, to: dateFormatter.date(from:inputDate)!)!

      // print("monthToDate - inputDate:\(inputDate) startDate:\(startDate) endDate:\(endDate)")
  
      return (startDate, endDate)
    }
  
  
  //  static func stringToDate(inputDate: String) -> Date {
  //    print("inputDate:\(inputDate)")
  ////    let dateFormatter = DateFormatter()
  //    let dateFormatter = ISO8601DateFormatter()
  ////    dateFormatter.calendar = Calendar(identifier: .iso8601)
  ////    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
  ////    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
  //    let date = dateFormatter.date(from:inputDate)!
  //    print("outputDate:\(date)")
  //
  //    return date
  //  }
  
  
  //  static func getDateFromString(dateString: String) -> Date? {
  //      let formatter = ISO8601DateFormatter()
  //      formatter.formatOptions = [.withInternetDateTime,
  //                                 .withDashSeparatorInDate,
  //                                 .withFullDate,
  ////                                 .withFractionalSeconds,
  //                                 .withColonSeparatorInTimeZone
  //                                  ]
  //      guard let date = formatter.date(from: dateString+"Z") else {
  //        return nil
  //      }
  //      return date
  //    }
  
}


extension Calendar {
  /*
   Week boundary is considered the start of the first day
   of the week and the end of the last day of the week
   */
  typealias WeekBoundary = (startOfWeek: Date?, endOfWeek: Date?)
  
  func currentWeekBoundary() -> WeekBoundary? {
    return weekBoundary(for: Date())
  }
  
  func weekBoundary(for date: Date) -> WeekBoundary? {
    let components = dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)
    
    guard let startOfWeek = self.date(from: components) else {
      return nil
    }
    
    let endOfWeekOffset = weekdaySymbols.count - 1
    let endOfWeekComponents = DateComponents(day: endOfWeekOffset, hour: 23, minute: 59, second: 59)
    guard let endOfWeek = self.date(byAdding: endOfWeekComponents, to: startOfWeek) else {
      return nil
    }
    
    return (startOfWeek, endOfWeek)
  }
}
