//
//  HomepageViewModel.swift
//  MyRewards
//
//  Created by Macbook Pro on 29/05/23.
//

import Foundation
import Combine

extension Homepage {
    class ViewModel: ObservableObject {
        @Published var loading: Bool = false
        
        private var cancellables = Set<AnyCancellable>()
        func getCoupons(appEnv: AppEnvironment, store: Loyalty) -> Void {
            self.loading = true
            
        }
    }
}