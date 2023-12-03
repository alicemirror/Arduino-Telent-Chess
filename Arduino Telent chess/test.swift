//// We can make the square's size a constant and use that

import SwiftUI
import CoreData


let squareSize: CGFloat = 50

// Our square
struct Square: View {
  var color: Color
  
  var body: some View {
    RoundedRectangle(cornerRadius: 5)
      .frame(width: squareSize, height: squareSize, alignment: .center)
      .foregroundColor(color)
    }
}


// Our preview
struct ComponentsSquares_Previews: PreviewProvider {
    static var previews: some View {
        // Colors
        let colors = [
            Color.red,
            Color.blue,
            Color.green,
            Color.yellow,
        ]

        // This will be our desi.5red spacing we want for our grid
        // If you want the grid to be truly square you can just set this to 'squareSize'
        let spacingDesired: CGFloat = 25

        // These are our grid items we'll use in the 'LazyHGrid'
        let rows = [
            GridItem(.fixed(squareSize), spacing: spacingDesired, alignment: .center),
            GridItem(.fixed(squareSize), spacing: spacingDesired, alignment: .center)
        ]

        // We then use the 'spacingDesired' in the grid
        LazyHGrid(rows: rows, alignment: .center, spacing: spacingDesired, pinnedViews: [], content: {
            ForEach(0 ..< 4) { colorIndex in
                Square(color: colors[colorIndex])
            }
        })
    }
}
