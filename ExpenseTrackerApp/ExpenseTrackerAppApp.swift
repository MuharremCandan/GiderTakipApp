//
//  ExpenseTrackerAppApp.swift
//  ExpenseTrackerApp
//
//  Created by Muharrem Candan on 16.05.2024.
//

import SwiftUI

@main
struct ExpenseTrackerAppApp: App {
   @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
