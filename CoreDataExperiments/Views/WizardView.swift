//
//  WizzardView.swift
//  CoreDataExperiments
//
//  Created by Mihai Leonte on 20/11/2019.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import SwiftUI


//demonstrate the merge strategy on moc.save
//in scene delegate: context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
struct WizardView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: self.moc)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    if self.moc.hasChanges {
                        try self.moc.save()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct WizzardView_Previews: PreviewProvider {
    static var previews: some View {
        WizardView()
    }
}
