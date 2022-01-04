//
//  OrderManager.swift
//  DominoStudy
//
//  Created by 순진이 on 2022/01/04.
//

import Foundation

class OrderManager {
    
    static let shared = OrderManager()
    
    //총금액
    var totalPrice = 0
    //메뉴: 수량
    var items: [String: Int] = [:]
    
    private init() {}
    
}

extension OrderManager {
    func addItem(itemName: String) {
        if let count = items[itemName] { //items에 물건이 이미 존쟁할 경우
            items[itemName] = count + 1
        } else {
            items[itemName] = 1
        }
    }
    
    func removeItem(itemName: String) {
        guard let count = items[itemName] else { return }
        items[itemName] = count - 1
    }
}
