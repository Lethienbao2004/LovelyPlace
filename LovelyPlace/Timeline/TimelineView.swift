//
//  ContentView.swift
//  LovelyPlaceSwiftUI
//
//  Created by Mark Le on 6/12/20.
//  Copyright © 2020 Mark Le. All rights reserved.
//

import SwiftUI

struct TimelineView: View {
    
    @Environment(\.managedObjectContext) private var moc
    @State private var isAddEventShowed = false
    @State private var isEditEventShowed = false
    //@ObservedObject var events = Events()
    @State private var selectedIndex = 0
    @Environment(\.editMode) var mode
    @FetchRequest(entity: Event.entity(), sortDescriptors: [], predicate: nil, animation: .default) var events: FetchedResults<Event>
    
    var body: some View {
        List{
            ForEach(events){ event in
                VStack{
                    HStack(spacing: 10){
                        Text("\(event.date?.month ?? Date().month)\n\(Calendar.current.dateComponents([.day], from: event.date ?? Date()).day ?? 0)")
                            .bold()
                            .multilineTextAlignment(.center)
                            .frame(width: 32)
                            
                        ZStack{
                            Color.accentColor.frame(width: 10)
                            Color.accentColor.frame(width: 16, height: 16)
                                .cornerRadius(8)
                            Color.white.frame(width: 8, height: 8)
                                .cornerRadius(4)
                        }
                        VStack(alignment: .leading){
                            Text(event.title ?? "")
                                .fontWeight(.bold)
                            Text(event.detail ?? "")
                        }
                        
                        
                    }
                }
                .contextMenu(/*@START_MENU_TOKEN@*/ContextMenu(menuItems: {
                    Menu {
                        Button(action: {
                            withAnimation(){
                                moc.delete(event)
                            }
                            
                            
                        }, label:{
                            Label("Delete", systemImage: "trash")

                        })
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    Button(action: {
                        if let index = events.firstIndex(of: event){

                            self.selectedIndex = index
                            self.isEditEventShowed = true
                        }
                    }, label: {
                        Label("Edit", systemImage: "pencil")
                    })

                })/*@END_MENU_TOKEN@*/)
                .sheet(isPresented: $isEditEventShowed, content: {
                    EditEventView(event: event).environment(\.managedObjectContext, moc)

                })
                .onTapGesture {
                    if mode?.wrappedValue == .active {
                        if let index = events.firstIndex(of: event){

                            self.selectedIndex = index
                            self.isEditEventShowed = true
                        }
                    }
                }
            }
            .onDelete(perform: deleteItems)
            
        }
        //.listStyle(GroupedListStyle())
        .navigationBarTitle("Timeline")
        .navigationBarItems(leading: EditButton(), trailing:
            Button(action:{
                self.isAddEventShowed.toggle()
//                let event = Event(context: moc)
//                event.id = UUID()
//                event.date = Date()
//                event.title = "Haaaaaa"
//                event.detail = "HA ơi Haa"
//                try? self.moc.save()
            }){
                Image(systemName: "plus")
            }
            .sheet(isPresented: $isAddEventShowed){
                NewEventView().environment(\.managedObjectContext, moc)
            }
        )
        
//        .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
//    func removeItems(at offsets: IndexSet) {
//        events.items.remove(atOffsets: offsets)
//    }
    private func addItem() {
        withAnimation {
            let newItem = Item(context: moc)
            newItem.timestamp = Date()

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

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { events[$0] }.forEach(moc.delete)

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

extension Date {
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self)
    }
}

struct TimelineList_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView()
    }
}
