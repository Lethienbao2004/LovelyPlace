//
//  EditEventView.swift
//  LovelyPlace
//
//  Created by Mark Le on 8/27/20.
//

import SwiftUI

struct EditEventView: View {
    let event: Event
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    //var event: Event
    @State private var isSaveButtonEnabled = false
    
    @State private var title: String = ""
    @State private var detail: String = ""
    @State private var date: Date = Date()
    
    
    var body: some View {
        NavigationView{
            List {
                TextField("Title", text: $title)
                TextEditor(text: $detail).frame(height:200)
                DatePicker("Please enter a date", selection: $date, in: ...Date(), displayedComponents: .date)
                    .labelsHidden()
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(minHeight: 330)
                
            }
            .navigationBarTitle("Edit Event",displayMode: .inline)
            .navigationBarItems(trailing:
                Button("Save"){
                    event.title = title
                    event.detail = detail
                    event.date = date
                    self.presentationMode.wrappedValue.dismiss()
                }
                    .disabled(event.detail != "" && event.detail != "How were your memories??" && event.title != "" ? false: true)
            )
            
            
        }
        .onAppear(){
            title = event.title ?? ""
            detail = event.detail ?? ""
            date = event.date ?? Date()
        }
    }
}

//struct EditEventView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditEventView(e
//    }
//}
