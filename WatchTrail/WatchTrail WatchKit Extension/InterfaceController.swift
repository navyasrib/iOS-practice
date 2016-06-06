//
//  InterfaceController.swift
//  WatchTrail WatchKit Extension
//
//  Created by basava on 6/6/16.
//  Copyright © 2016 basava. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var Slider: WKInterfaceSlider!
    
    @IBOutlet var Picker: WKInterfacePicker!
    
    @IBAction func ShowAlertClicked() {
        let cancel = WKAlertAction(title: "Cancel", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
        })
        let action = WKAlertAction(title: "Action", style: WKAlertActionStyle.Default, handler: { () -> Void in
        })
        self.presentAlertControllerWithTitle("Alert message", message: "trail", preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert, actions: [cancel, action])
    }
    
    override
    func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var pickerItems: [WKPickerItem] = []
        for i in 1...5 {
            let item = WKPickerItem()
            item.title = "items \(i)"
            pickerItems.append(item)
        }
        self.Picker.setItems(pickerItems)
    }
    
    override
    func willActivate() {
        super.willActivate()
        
        self.animateWithDuration(10) { () -> Void in
            self.Slider.setHeight(0)
            self.Slider.setAlpha(0)
        }
    }
}
