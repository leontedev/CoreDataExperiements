//
//  FilteredListView.swift
//  CoreDataExperiments
//
//  Created by Mihai Leonte on 20/11/2019.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import SwiftUI

struct FilteredListView: View {
    @Environment(\.managedObjectContext) var moc
    @State var lastNameFilter = "A"
    
    var body: some View {

        
        VStack {
            //FilteredList(filter: lastNameFilter)
            FilteredList(predicate: .beginsWith,
                         filterKey: "lastName",
                         filterValue: lastNameFilter,
                         sortKey: "lastName",
                         sortAsc: true) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"

                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"

                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"

                try? self.moc.save()
            }

            Button("Show A") {
                self.lastNameFilter = "A"
            }

            Button("Show S") {
                self.lastNameFilter = "S"
            }
        }
    }
}

struct FilteredListView_Previews: PreviewProvider {
    static var previews: some View {
        FilteredListView()
    }
}
