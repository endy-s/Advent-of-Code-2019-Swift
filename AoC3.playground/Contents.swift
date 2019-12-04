import UIKit

func CGPointManhattanDistance(from: CGPoint, to: CGPoint) -> CGFloat {
    return (abs(from.x - to.x) + abs(from.y - to.y))
}

func drawWirePath(for orientations: [String]) -> UIBezierPath {
    var tempPath = UIBezierPath()
    tempPath.move(to: CGPoint(x: 0, y: 0))
    orientations.forEach { (movement) in
        guard let movementCharacter = movement.first,
            let movementDouble = Double(String(movement.dropFirst())) else { return }
        let movementDistance = CGFloat(movementDouble)
        
        let nextPoint: CGPoint
        switch movementCharacter {
        case "R":
            nextPoint = CGPoint(x: tempPath.currentPoint.x + movementDistance, y: tempPath.currentPoint.y)
        case "L":
            nextPoint = CGPoint(x: tempPath.currentPoint.x - movementDistance, y: tempPath.currentPoint.y)
        case "U":
            nextPoint = CGPoint(x: tempPath.currentPoint.x, y: tempPath.currentPoint.y + movementDistance)
        case "D":
            nextPoint = CGPoint(x: tempPath.currentPoint.x, y: tempPath.currentPoint.y - movementDistance)
        default:
            nextPoint = tempPath.currentPoint
            print("Unknow movement character")
            // Do nothing
        }
        tempPath.addLine(to: nextPoint)
        tempPath.move(to: nextPoint)
    }
    return tempPath
}

//let firstWire = [R1009, U34, L600, U800, R387, D247, R76, U797, R79, D582, L325, D236, R287, U799, R760, U2, L261, D965, R854, D901, R527, D998, R247, U835, L29, U525, L10, D351, L599, D653, L39, D112, R579, D650, L539, D974, R290, U729, L117, D112, L926, U270, L158, D800, L291, U710, L28, D211, R700, U691, L488, D307, R448, U527, L9, D950, L535, D281, L683, U576, L372, U849, R485, D237, L691, U453, L667, U856, R832, U956, L47, D951, R171, U484, R651, D731, L768, D44, R292, U107, L237, U731, L795, D460, R781, U77, L316, U873, L994, D322, L479, U121, R754, U68, L454, D162, L308, D986, L893, D808, R929, D328, L591, D718, R616, U139, R221, U124, R477, U614, L439, D329, R217, D157, L65, D460, R523, U955, R512, D458, L823, D975, R506, D870, R176, U558, R935, U319, L281, D470, L285, U639, L974, U186, L874, U487, L979, D95, R988, U398, R776, D637, R75, U331, R746, D603, R102, U978, R702, U89, L48, D757, L173, D422, L394, U800, R955, U644, R911, D327, R471, D313, L982, D93, R998, U549, R210, D640, R332, U566, R736, U302, L69, U677, L137, U674, R204, D720, R868, U143, L635, D177, L277, D749, R180, D432, R451, D426, R559, U964, L35, U452, L848, D707, R758, D41, R889, D966, R460, U11, R819, D30, L953, U150, L621, U915, R400, D723, R299, D93, L987, D790, L541, U864, R711, D968, L2, D963, L996, D260, L824, D765, L617, U257, R175, U786, L873, D118, L433, U246, R821, D308, L468, U53, R859, U806, L197, D663, R540, D84, L398, D945, L999, U114, L731, D676, L538, U680, R519, U313, R699, U746, R471, D393, L902, U697, R542, D385, R183, U463, R276, U990, R111, U709, R726, D996, L728, D215, R726, D911, L199, D484, R282, U129, L329, U309, L270, U990, L813, U242, L353, D741, R447, D253, L556, U487, L102, D747, L965, D743, R768, U589, R657, D910, L760, D981, L982, D292, R730, U236, L831]


let testFirstInput = ["R8", "U5", "L5", "D3"]
let testSecondInput = ["U7", "R6", "D4", "L4"]

var testFirstPath = drawWirePath(for: testFirstInput)
var testSecondPath = drawWirePath(for: testSecondInput)


testFirstPath.contains(testSecondPath)

print(testFirstPath)
print(testSecondPath)

