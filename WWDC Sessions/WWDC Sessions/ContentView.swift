/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The primary view for the main WindowGroup of the app.
*/

import SwiftUI

struct ContentView: View {
    @State var selections: Set<LocalSession> = Set()
    @State var selection: LocalSession? = nil
    @State var visibility: NavigationSplitViewVisibility = .doubleColumn
    
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            VideoSelectorSidebar(selections: $selections)
        } detail: {
            DetailView(selection: $selection)
        }
        .navigationSplitViewStyle(.balanced)
        .onChange(of: selections, perform: { newSelections in
            if newSelections.count == 1 {
                self.selection = newSelections.first!
            } else if newSelections.isEmpty {
                self.selection = nil
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SessionManager())
    }
}
