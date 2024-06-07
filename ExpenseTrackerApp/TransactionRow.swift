//
//  TransactionRow.swift
//  ExpenseTrackerApp
//
//  Created by Muharrem Candan on 16.05.2024.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
    var transaction : Transaction
    var body: some View {
        HStack(spacing :20){
            
            //Mark: Transaction Category  Icon
            RoundedRectangle(cornerRadius: 20 ,style:.continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44 , height:44)
                .overlay{
                    FontIcon.text(.awesome5Solid(code: transaction.icon) , fontsize: 24 ,  color: Color.icon1)
                }
                
        
            
            VStack(alignment:.leading ,spacing: 6){
                //Mark : Transaction Merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                //Mark : Transaction Category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                //Mark :Transaction Date
                Text(transaction.dateParsed , format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
            
            //Mark : Transactiım amount
            Text(transaction.signedAmount , format: .currency(code: "USD"))
                .bold()
                .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.text : .primary)
        }.padding([.top , .bottom] , 8)
    }
}

#Preview {
    TransactionRow(transaction: transactionPreviewData)
}
