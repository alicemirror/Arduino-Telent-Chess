//var body: some View {
//    GeometryReader { geometry in
//        let size = min(geometry.size.width, geometry.size.height)
//        let squareSize = size / 8
//
//        VStack(spacing: 0) {
//            ForEach(0..<8, id: \.self) { row in
//                HStack(spacing: 0) {
//                    ForEach(0..<8, id: \.self) { column in
//                        ChessSquareView(piece: board[row][column], isLightSquare: (row + column) % 2 == 0)
//                            .frame(width: squareSize, height: squareSize)
//                    }
//                }
//            }
//        }
//        .frame(width: size, height: size, alignment: .center)
//        .border(Color.black, width: 2)
//    }
//}
