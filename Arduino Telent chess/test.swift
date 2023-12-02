//import SwiftUI
//
//struct ChessboardView: View {
//    // This represents the state of the board, for example, using 2D array
//    let board: [[String]] = [
//        ["R", "N", "B", "Q", "K", "B", "N", "R"],
//        ["P", "P", "P", "P", "P", "P", "P", "P"],
//        ["", "", "", "", "", "", "", ""],
//        ["", "", "", "", "", "", "", ""],
//        ["", "", "", "", "", "", "", ""],
//        ["", "", "", "", "", "", "", ""],
//        ["r", "n", "b", "q", "k", "b", "n", "r"],
//        ["p", "p", "p", "p", "p", "p", "p", "p"]
//    ]
//
//    var body: some View {
//        VStack(spacing: 0) {
//            ForEach(0..<8, id: \.self) { row in
//                HStack(spacing: 0) {
//                    ForEach(0..<8, id: \.self) { column in
//                        ChessSquareView(piece: board[row][column], isLightSquare: (row + column) % 2 == 0)
//                    }
//                }
//            }
//        }
//        .border(Color.black, width: 2)
//    }
//}
//
//struct ChessSquareView: View {
//    var piece: String
//    var isLightSquare: Bool
//
//    var body: some View {
//        ZStack {
//            Rectangle()
//                .fill(isLightSquare ? Color.white : Color.gray)
//            Image(systemName: iconName(for: piece))
//                .resizable()
//                .scaledToFit()
//                .frame(width: 40, height: 40)
//        }
//    }
//
//    // Function to get the correct icon name based on the piece
//    func iconName(for piece: String) -> String {
//        switch piece {
//        case "R": return "Rook_White"    // replace with your image names
//        case "N": return "Knight_White"
//        case "B": return "Bishop_White"
//        default: return ""
//        }
//    }
//}
//
//struct ChessboardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChessboardView()
//    }
//}
