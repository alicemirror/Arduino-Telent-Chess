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

// Main view with a list
struct RectangleListView: View {
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
        // Add more items with different color combinations as needed
    ]

    var body: some View {
        List(items.indices, id: \.self) { index in
            CustomListItemView(item: $items[index]) {
                // Exclusive selection logic
                for i in items.indices {
                    items[i].isSelected = (i == index)
                }
            }
        }
    }
}







//import SwiftUI
//
//// Define your data model
//struct RectangleItem: Identifiable {
//    let id = UUID()
//    var isSelected: Bool
//}
//
//// Define the custom list item view
//struct CustomListItemView: View {
//    let colorWhite: Color
//    
//    @Binding var item: RectangleItem
//    var onSelect: () -> Void
//
//    var body: some View {
//        HStack {
//            // Checkbox
//            Image(systemName: item.isSelected ? "checkmark.circle.fill" : "circle")
//                .onTapGesture {
//                    onSelect()
//                }
//
//            // Two horizontal rectangles
//            HStack {
//                Rectangle()
//                    .fill(colorWhite)
//                    .frame(width: squareSize, height: squareSize)
//                Rectangle()
//                    .fill(Color.green)
//                    .frame(width: squareSize, height: squareSize)
//            }
//        }
//    }
//}
//
//// Selectable list view to choose the
//// chesbboard theme.
//struct RectangleListView: View {
//    @State private var items: [RectangleItem] = (0..<boardThemes.count).map { _ in RectangleItem(isSelected: false) }
//
//    var body: some View {
//        List(items.indices, id: \.self) { index in
//            CustomListItemView(item: $items[index]) {
//                // Exclusive selection logic
//                for i in items.indices {
//                    items[i].isSelected = (i == index)
//                }
//            }
//        }
//    }
//}
//
