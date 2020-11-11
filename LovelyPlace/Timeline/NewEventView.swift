//
//  NewEventView.swift
//  LovelyPlaceSwiftUI
//
//  Created by Mark Le on 6/13/20.
//  Copyright © 2020 Mark ÷÷÷Le. All rights reserved.
//

import SwiftUI

struct NewEventView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    //@ObservedObject var events: Events
    
    @State private var title = "" //{
//        didSet{
//            if detail != "" && detail != "How were your memories??" && title != ""{
//                isSaveButtonEnabled = true
//                print(title, detail)
//            }
//        }
//    }
    @State private var detail = "How were your memories??"//{
//        didSet{
//            if detail != "" && detail != "How were your memories??" && title != ""{
//                isSaveButtonEnabled = true
//            }
//        }
//    }
    @State private var date = Date()
    @State private var isSaveButtonEnabled = false
    
    var body: some View {
        NavigationView{
            List {
                TextField("Title", text: $title)
//                TextField("Detail", text: $detail)
                TextEditor(text: $detail).frame(height:200)
                DatePicker("Please enter a date", selection: $date, in: ...Date(), displayedComponents: .date)
                    .labelsHidden()
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(minHeight: 330)
                
            }
            .navigationBarTitle("New Event",displayMode: .inline)
            .navigationBarItems(leading:
                Button("Cancel"){
                    self.presentationMode.wrappedValue.dismiss()
                }, trailing:
                Button("Save"){
                    
                    let event = Event(context: moc)
                    event.title = self.title
                    event.detail = self.detail
                    event.date = self.date
                    saveItems()
                    self.presentationMode.wrappedValue.dismiss()
                }
                    .disabled(detail != "" && detail != "How were your memories??" && title != "" ? false: true)
            )
            
            
        }
        
    }
    private func saveItems() {
        withAnimation(){
            do {
                try moc.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct NewEventView_Previews: PreviewProvider {
    static var previews: some View {
        NewEventView()
    }
}
