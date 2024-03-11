//
//  CostInfomation.swift
//  ParcelInvoiceMaker
//
//  Created by Kyeongmo Yang on 3/7/24.
//

import Foundation

class DiscountStrategyFactory {
    static func strategy(forIndex index: Int) -> DiscountStrategy? {
        switch index {
        case 0: return NoDiscount()
        case 1: return VIPDiscount()
        case 2: return CouponDiscount()
        case 3: return MistakeCompensationDiscount()
        default: return nil // 기본 값
        }
    }
}

struct CostInfomation {
    static let vipDiscountRatio: Double = 0.8
    static let couponDiscountRatio: Double = 0.5
    static let mistakeCompensationDiscountRatio: Double = 0.7
    
    let deliveryCost: Int
    private let discountStrategy: DiscountStrategy
    var discountedCost: Int {
        discountStrategy.applyDiscount(deliveryCost: deliveryCost)
    }
    
    init(deliveryCost: Int, discountStrategy: DiscountStrategy) {
        self.deliveryCost = deliveryCost
        self.discountStrategy = discountStrategy
    }
}
