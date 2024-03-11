//
//  DiscountStrategy.swift
//  ParcelInvoiceMaker
//
//  Created by Kyeongmo Yang on 3/7/24.
//

import Foundation

protocol DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int
}

struct NoDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int {
        deliveryCost
    }
}
    
struct VIPDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int {
        deliveryCost.calculateCost(by: CostInfomation.vipDiscountRatio)
    }
}

struct CouponDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int {
        deliveryCost.calculateCost(by: CostInfomation.couponDiscountRatio)
    }
}

struct MistakeCompensationDiscount: DiscountStrategy {
    func applyDiscount(deliveryCost: Int) -> Int {
        deliveryCost.calculateCost(by: CostInfomation.mistakeCompensationDiscountRatio)
    }
}

fileprivate extension Int {
    func calculateCost(by discountRatio: Double) -> Int {
        Int(Double(self) * discountRatio)
    }
}
