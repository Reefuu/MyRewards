//
//  CustomerStoreInfoViewModel.swift
//  MyRewards
//
//  Created by Macbook Pro on 27/05/23.
//

import Foundation

extension CustomerStoreInfo{
    class ViewModel: ObservableObject {
        
        @Published var openSheet: Bool = false
        @Published var selectedCoupon: Coupon?
        
        init() {}
    }
}
