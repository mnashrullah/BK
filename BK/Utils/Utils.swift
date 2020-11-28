//
//  Utils.swift
//  mila
//
//  Created by Muhammad Nashrullah on 26/11/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI
import Foundation

func calcAge(birthday: Date) -> String {
    let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
    let now = Date()
    let calcAge = calendar.components([.year, .month, .day], from: birthday, to: now, options: [])
    let age: Int = calcAge.year ?? 0
    let month: Int = calcAge.month ?? 0
    let day: Int = calcAge.day ?? 0
    var result : String = ""
    if (age > 0){
        result = "\(age) tahun \(month) bulan"
    } else if (age == 0 && month > 0){
        result = "\(month) bulan \(day) hari"
    } else if (age == 0 && month == 0 && day > 0){
        result = "\(day) hari"
    } else if (age == 0 && month == 0 && day == 0){
        result = "\(day+1) hari"
    } else {
        result = ""
    }
    return result
}


func calcAgeMonth(birthday: Date) -> Int {
    let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
    let now = Date()
    let calcAge = calendar.components([.year, .month, .day], from: birthday, to: now, options: [])
    let age : Int = calcAge.year ?? 0
    let month: Int = calcAge.month ?? 0
    let result : Int = (age*12) + month
    return result
}

