import SwiftUI

struct ContentView: View {
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    @State private var selectedTiles: Set<Int> = []

    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(0..<9, id: \.self) { index in
                TileView(isSelected: selectedTiles.contains(index))
                    .onTapGesture {
                        if selectedTiles.contains(index) {
                            selectedTiles.remove(index)
                        } else {
                            selectedTiles.insert(index)
                        }
                    }
            }
        }
        .padding()
    }
}

struct TileView: View {
    var isSelected: Bool

    var body: some View {
        Rectangle()
            .foregroundColor(isSelected ? .green : .gray)
            .frame(width: 100, height: 100)
            .cornerRadius(10)
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

