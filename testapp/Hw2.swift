import SwiftUI

struct Hw2: View {
    
    let rows: Int
    let cols: Int
    
    @State private var x = 0
    @State private var y = 0
    
    @State private var arrGame: [[Bool]]
    
    let recWid: CGFloat
    let recHei: CGFloat
    
    init(rows: Int, cols: Int) {
        self.rows = rows
        self.cols = cols
        
        // نقطة البداية في منتصف الشبكة
        let startX = rows / 2
        let startY = cols / 2
        _x = State(initialValue: startX)
        _y = State(initialValue: startY)
        
        // إنشاء مصفوفة الشبكة
        var arr = Array(repeating: Array(repeating: false, count: cols), count: rows)
        arr[startX][startY] = true
        _arrGame = State(initialValue: arr)
        
        // حساب حجم المربعات
        recWid = UIScreen.main.bounds.width / CGFloat(cols)
        recHei = UIScreen.main.bounds.height * 0.6 / CGFloat(rows)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<rows, id: \.self) { r in
                HStack(spacing: 0) {
                    ForEach(0..<cols, id: \.self) { c in
                        Rectangle()
                            .fill(arrGame[r][c] ? .red : .white)
                            .frame(width: recWid, height: recHei)
                            .border(.blue)
                    }
                }
            }
            
            VStack(spacing: 15) {
                
                Button(action: moveUp) {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.largeTitle)
                }
                .frame(width: UIScreen.main.bounds.width*0.9,alignment: .center)
                
                HStack(spacing: 40) {
                    
                    Button(action: moveLeft) {
                        Image(systemName: "arrow.left.circle.fill")
                            .font(.largeTitle)
                    }
                    .frame(width: UIScreen.main.bounds.width*0.5,alignment: .center)
                    
                    
                    Button(action: moveRight) {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.largeTitle)
                    }
                    .frame(width: UIScreen.main.bounds.width*0.5,alignment: .center)
                    
                }
                Button(action: moveDown) {
                    Image(systemName: "arrow.down.circle.fill")
                        .font(.largeTitle)
                }
                .frame(width: UIScreen.main.bounds.width*0.9,alignment: .center)
                
            }
            .padding(.top, 20)
        }
    }
    
    func moveUp()    { updatePos(newX: x - 1, newY: y) }
    func moveDown()  { updatePos(newX: x + 1, newY: y) }
    func moveLeft()  { updatePos(newX: x, newY: y - 1) }
    func moveRight() { updatePos(newX: x, newY: y + 1) }
    
    func updatePos(newX: Int, newY: Int) {
        let wrappedX = (newX + rows) % rows
        let wrappedY = (newY + cols) % cols
        arrGame[x][y] = false
        x = wrappedX
        y = wrappedY
        arrGame[x][y] = true
    }

}
