//
//  TransactionList.swift
//  ExpenseTrackerApp
//
//  Created by Muharrem Candan on 17.05.2024.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM : TransactionListViewModel
    var body: some View {
        VStack{
            List{
                // Transaction Groups
                ForEach(Array(transactionListVM.groupTransactionByMonth()) , id:\.key){ month ,transactions in
                    Section {
                        //Mark : Transaction List
                        ForEach(transactions){transaction in
                            TransactionRow(transaction: transaction)
                            
                        }
                        
                    } header: {
                        //Mark : Transaction month
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
                

                
            }
            .listStyle(.plain)
        }
        
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    
    // ViewModel'inizi oluşturun ve verilerini atayın
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        
        // NavigationView içinde TransactionList'i environmentObject olarak kullanarak dönün
        return NavigationView {
            TransactionList() // Burada TransactionList() kullanıldı
                .environmentObject(transactionListVM)
        }
}
