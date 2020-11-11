//
//  ComplicationController.swift
//  LovelyPlaceWatch Extension
//
//  Created by Mark Le on 8/29/20.
//

import SwiftUI
import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    var settingInfo = AWSettingInfo.shared
    
    // MARK: - Complication Configuration

    func getComplicationDescriptors(handler: @escaping ([CLKComplicationDescriptor]) -> Void) {
        let descriptors = [
            CLKComplicationDescriptor(identifier: "complication", displayName: "LovelyPlace", supportedFamilies: CLKComplicationFamily.allCases)
            // Multiple complication support can be added here with more descriptors
        ]
        
        // Call the handler with the currently supported complication descriptors
        handler(descriptors)
    }
    
    func handleSharedComplicationDescriptors(_ complicationDescriptors: [CLKComplicationDescriptor]) {
        // Do any necessary work to support these newly shared complication descriptors
    }

    // MARK: - Timeline Configuration
    
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        // Call the handler with the last entry date you can currently provide or nil if you can't support future timelines
        let midnight = Calendar.current.startOfDay(for: Date())
        handler(midnight.addingTimeInterval(24.0 * 60.0 * 60.0))
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        // Call the handler with your desired behavior when the device is locked
        handler(.hideOnLockScreen)
    }
    

    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        handler(createTimelineEntry(forComplication: complication, date: Date()))
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after the given date
        let fiveMinutes = 5.0 * 60.0
        let twentyFourHours = 24.0 * 60.0 * 60.0
        
        // Create an array to hold the timeline entries.
        var entries = [CLKComplicationTimelineEntry]()
        
        // Calculate the start and end dates.
        var current = date.addingTimeInterval(fiveMinutes)
        let endDate = date.addingTimeInterval(twentyFourHours)
        
        // Create a timeline entry for every five minutes from the starting time.
        // Stop once you reach the limit or the end date.
        while (current.compare(endDate) == .orderedAscending) && (entries.count < limit) {
            entries.append(createTimelineEntry(forComplication: complication, date: current))
            current = current.addingTimeInterval(fiveMinutes)
        }
        
        handler(entries)
    }

    // MARK: - Sample Templates
    
//    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
//        // This method will be called once per supported complication, and the results will be cached
//        handler(nil)
//    }
    
    // MARK: - Private Methods
    // Return a timeline entry for the specified complication and date.
    private func createTimelineEntry(forComplication complication: CLKComplication, date: Date) -> CLKComplicationTimelineEntry {
        
        // Get the correct template based on the complication.
        let template = createTemplate(forComplication: complication, date: date)
        
        // Use the template and date to create a timeline entry.
        return CLKComplicationTimelineEntry(date: date, complicationTemplate: template)
    }
    private func createTemplate(forComplication complication: CLKComplication, date: Date) -> CLKComplicationTemplate {
        
        if complication.family == .graphicBezel {
            return createGraphicBezelTemplate(forDate: Date())
        } else if complication.family == .utilitarianLarge{
            return createUtilitarianLargeFlatTemplate(forDate: Date())
        } else if complication.family == .graphicCircular{
            return CLKComplicationTemplateGraphicCircularView(BezelGraphicCircularView())
        } else{
            return CLKComplicationTemplateGraphicCircularView(BezelGraphicCircularView())
        }
        
        
    
    }
    private func createGraphicBezelTemplate(forDate date: Date) -> CLKComplicationTemplate {
        
        let circle = CLKComplicationTemplateGraphicCircularView(BezelGraphicCircularView())
        
//
//        // Create a graphic circular template with an image provider.
//        let circle = CLKComplicationTemplateGraphicCircularImage(
//        circle.imageProvider = CLKFullColorImageProvider(fullColorImage: #imageLiteral(resourceName: "CoffeeGraphicCircular"))

        // Create the text provider.
//        let mgCaffeineProvider = CLKSimpleTextProvider(text: data.mgCaffeineString(atDate: date))
//        let mgUnitProvider = CLKSimpleTextProvider(text: "mg Caffeine", shortText: "mg")
//        mgUnitProvider.tintColor = data.color(forCaffeineDose: data.mgCaffeine(atDate: date))
//        let combinedMGProvider = CLKTextProvider(format: "%@ %@", mgCaffeineProvider, mgUnitProvider)
//
//        let numberOfCupsProvider = CLKSimpleTextProvider(text: data.totalCupsTodayString)
//        let cupsUnitProvider = CLKSimpleTextProvider(text: "Cups", shortText: "C")
//        cupsUnitProvider.tintColor = data.color(forTotalCups: data.totalCupsToday)
//        let combinedCupsProvider = CLKTextProvider(format: "%@ %@", numberOfCupsProvider, cupsUnitProvider)
//
//        let separator = NSLocalizedString(",", comment: "Separator for compound data strings.")
//
//
        
        let textProvider = CLKSimpleTextProvider(text: "Bảoo ♥ Haaaaaa")

        // Create the bezel template using the circle template and the text provider.
        let template = CLKComplicationTemplateGraphicBezelCircularText(circularTemplate: circle)
        template.textProvider = textProvider
        //template.circularTemplate = circle
        return template
    }
    
    private func createUtilitarianLargeFlatTemplate(forDate date: Date) -> CLKComplicationTemplate {
        let template = CLKComplicationTemplateUtilitarianLargeFlat(textProvider: CLKSimpleTextProvider(text: "\(settingInfo.dateComponents) days together"))
        return template
    }
    
}
