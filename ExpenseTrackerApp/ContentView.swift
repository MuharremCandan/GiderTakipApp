//
//  ContentView.swift
//  ExpenseTrackerApp
//
//  Created by Muharrem Candan on 16.05.2024.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM : TransactionListViewModel
    
    //var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment:.leading , spacing: 24){
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    // Mark : Chart
                    let data = transactionListVM.accumulateTransaction()
                    if !data.isEmpty{
                        let totalExpenses = data.last?.1 ?? 0
                        
                        CardView {
                            VStack(alignment: .leading){
                                ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title , format: "$%.02f")
                                
                                LineChart()
                            }
                            .background(Color.systemBackground)
                        }
                                .data(data)
                                .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4) , Color.icon)))
                            .frame(height: 300)
                            
                        
                    }
                    
                   
                    
                    
                    //Mark : Transaction List
                    RecentTransactionList()
                        
                }
                .padding()
                .frame(maxWidth : .infinity)
            }
            .background(Color.background)
            .navigationViewStyle(.stack)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .renderingMode(.original)
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
            
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}
    

#Preview {
    let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        
        return RecentTransactionList()
            .environmentObject(transactionListVM)
}
