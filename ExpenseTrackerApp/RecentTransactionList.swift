//
//  RecentTransactionList.swift
//  ExpenseTrackerApp
//
//  Created by Muharrem Candan on 17.05.2024.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM:TransactionListViewModel
    
    var body: some View {
        VStack{
            HStack{
                //Mark : Header Title
                Text("Recent Transaction")
                    .bold()
                Spacer()
                //Mark : Header Link
                NavigationLink{
                    TransactionList()
                }label: {
                    HStack(spacing: 4){
                        Text("See all")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
           
            }
            .padding(.top)
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()) , id: \.element){index , transaction in
                TransactionRow(transaction: transaction)
                Divider()
                    .opacity(index == 4 ? 0 : 1 )
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20 , style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius:10 , x:0 , y: 5)
        
    }
}

#Preview {
   
    
    let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        
        return RecentTransactionList()
            .environmentObject(transactionListVM)
}
