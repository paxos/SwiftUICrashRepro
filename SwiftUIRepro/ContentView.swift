//
//  ContentView.swift
//  SwiftUIRepro
//
//  Created by Patrick Dinger on 7/4/20.
//  Copyright © 2020 Patrick Dinger. All rights reserved.
//

import SwiftUI

struct MySection: Identifiable {
    let id = UUID()
    var title: String
    var rows: [MyRow]
}

struct MyRow: Identifiable {
    let id = UUID()
    var title: String
}

struct ContentView: View {
    @State var sections: [MySection] = []
    
    var body: some View {
        VStack {
            List {
                ForEach(sections) { section in
                    Section(header: Text(section.title)) {
                        ForEach(section.rows) { row in
                            Text(row.title)
                        }
                    }
                }
            }
            Button(action: {
                self.sections = self.sections.reversed()
            }) { Text("Shuffle stuff and crash")}
        }
        .frame(width: 800, height: 800)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let section1 = MySection(title: "section 1", rows: [MyRow(title: "Row1.1")])
        let section2 = MySection(title: "section 2", rows: [MyRow(title: "Row2.1")])
        
        return ContentView(sections: [section1, section2])
    }
}
