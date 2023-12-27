import SwiftUI

// Define the data model with the variable properties
// of a generic element of the list.
struct RectangleItem: Identifiable {
    let id = UUID()
    var isSelected: Bool
    var color1: Color
    var color2: Color
}

// Define the custom list item view
struct CustomListItemView: View {
    @Binding var item: RectangleItem
    var onSelect: () -> Void

    var body: some View {
        HStack {
            // Checkbox
            Image(systemName: item.isSelected ? "checkmark.circle.fill" : "circle")
                .onTapGesture {
                    onSelect()
                }
            // Two horizontal rectangles with dynamic colors
            HStack {
                Rectangle()
                    .fill(item.color1)
                    .frame(width: squareSize, height: squareSize)
                    .border(Color.black, width: tilesStrokeWidth)
                    .cornerRadius(tilesCornerRadius)
                Rectangle()
                    .fill(item.color2)
                    .frame(width: squareSize, height: squareSize)
                    .border(Color.black, width: tilesStrokeWidth)
                    .cornerRadius(tilesCornerRadius)
            }
        }
    }
}


struct SelectChessboardThemeView: View {
    // Color pair items for every theme option
    @State private var items: [RectangleItem] = [
        // Initialize items with different colors
        RectangleItem(isSelected: false, color1: boardColors[0],
                      color2: boardColors[1]),
        RectangleItem(isSelected: false, color1: boardColors[2],
                      color2: boardColors[3]),
        RectangleItem(isSelected: false, color1: boardColors[4],
                      color2: boardColors[5]),
        RectangleItem(isSelected: false, color1: boardColors[6],
                      color2: boardColors[7]),
        RectangleItem(isSelected: false, color1: boardColors[8],
                      color2: boardColors[9]),
        RectangleItem(isSelected: false, color1: boardColors[10],
                      color2: boardColors[11]),
    ]
    
    var body: some View {
        VStack {
            ForEach(items.indices, id: \.self) { index in
                CustomListItemView(item: $items[index]) {
                    // Exclusive selection logic
                    for i in items.indices {
                        items[i].isSelected = (i == index)
                    } // indices loop
                } // List item view
            } // CustomListItemView for every option
        } // VStack
    } // body
} // SelectChessboardThemeView
