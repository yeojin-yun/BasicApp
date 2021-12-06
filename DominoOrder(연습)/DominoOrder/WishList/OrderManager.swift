//
//  OrderManager.swift
//  DominoOrder
//
//  Created by 순진이 on 2021/12/06.
//

import Foundation

class OrderManager {
    static let shared = OrderManager()
    
    var wishDictionary: [String:Int] = [:]
    var keysDictionary: [String] = []
    var valuesDictionary: [Int] = []
    
    
    private init() {}
    
}
