//
//  ContentView.swift
//  CoreDataExperiments
//
//  Created by Mihai Leonte on 19/11/2019.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Kountry.entity(), sortDescriptors: []) var countries: FetchedResults<Kountry>
    
    var body: some View {
        //WizardView()
        //PredicateView()
        //FilteredListView()
        
        VStack {
            List {
                ForEach(countries, id: \.self) { country in
                    Section(header: Text(country.wrappedFullName)) {
                        ForEach(country.candyArray, id: \.self) { candy in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }

            Button("Add") {
                let candy1 = Kandy(context: self.moc)
                candy1.name = "Mars"
                candy1.origin = Kountry(context: self.moc) //.addToOrigin()
                candy1.origin?.shortName = "UK"
                candy1.origin?.fullName = "United Kingdom"

                let candy2 = Kandy(context: self.moc)
                candy2.name = "KitKat"
                candy2.origin = Kountry(context: self.moc)
                candy2.origin?.shortName = "UK"
                candy2.origin?.fullName = "United Kingdom"

                let candy3 = Kandy(context: self.moc)
                candy3.name = "Twix"
                candy3.origin = Kountry(context: self.moc)
                candy3.origin?.shortName = "UK"
                candy3.origin?.fullName = "United Kingdom"

                let candy4 = Kandy(context: self.moc)
                candy4.name = "Toblerone"
                candy4.origin = Kountry(context: self.moc)
                candy4.origin?.shortName = "CH"
                candy4.origin?.fullName = "Switzerland"

                try? self.moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
