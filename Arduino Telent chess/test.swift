import SwiftUI

enum DestinationX: Hashable {
    case detailView1
    case detailView2
}

struct ContentView: View {
    @State private var navigationSelection: DestinationX?

    var body: some View {
        NavigationStack {
            Text("Main View")
                .navigationTitle("Home")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        // Hidden Navigation Links
                        ForEach([DestinationX.detailView1, DestinationX.detailView2], id: \.self) { destination in
                            NavigationLink("", tag: destination, selection: $navigationSelection) {
                                destinationView(for: destination)
                            }
                        }

                        // Toolbar Buttons
                        Button("Detail 1") {
                            navigationSelection = .detailView1
                        }
                        Button("Detail 2") {
                            navigationSelection = .detailView2
                        }
                    }
                }
        }
    }

    @ViewBuilder
    private func destinationView(for destination: DestinationX) -> some View {
        switch destination {
        case .detailView1:
            DetailView1()
        case .detailView2:
            DetailView2()
        }
    }
}

struct DetailView1: View {
    var body: some View {
        Text("This is Detail View 1")
            .navigationTitle("Detail 1")
    }
}

struct DetailView2: View {
    var body: some View {
        Text("This is Detail View 2")
            .navigationTitle("Detail 2")
    }
}
