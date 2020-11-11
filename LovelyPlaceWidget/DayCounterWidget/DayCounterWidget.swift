//
//  LovelyPlaceWidget.swift
//  LovelyPlaceWidget
//
//  Created by Mark Le on 8/21/20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Calendar.current.startOfDay(for: Date())
        for dayOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
            print("abc")
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    
}

struct DayCounterWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family: WidgetFamily

    @ViewBuilder var body: some View {
        switch family {
        case .systemSmall: SmallDayCounter(settingInfo: UserData())
        case .systemMedium: MediumDayCounter(settingInfo: UserData())
        case .systemLarge: LargeDayCounter(settingInfo: UserData())
        default: SmallDayCounter(settingInfo: UserData())
        }
    }
}

@main
struct DayCounterWidget: Widget {
    let kind: String = "LovelyPlaceWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            DayCounterWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Day Counter")
        .description("Keep track of how many days you belong together.")
    }
}

struct LovelyPlaceWidget_Previews: PreviewProvider {
    static var previews: some View {
        DayCounterWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
