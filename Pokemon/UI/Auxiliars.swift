import Foundation

class Auxiliars {
    static func clear() {
        print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
    }
    
    static func countSpaces(name: String, size: Int) -> String {
        let nameLength = name.count
        let totalSpaces = (size - nameLength) / 2
        
        let leftSpaces = String(repeating: " ", count: totalSpaces)
        let rightSpaces = String(repeating: " ", count: size - nameLength - totalSpaces)
        
        return leftSpaces + name + rightSpaces
    }
    
    static func printInLines(string1: String, string2: String, amount: Int) {
        let lines1 = string1.split(separator: "\n")
        let lines2 = string2.split(separator: "\n")
        
        let maxLines = max(lines1.count, lines2.count)
        
        func getLine(_ lines: [Substring], index: Int) -> String {
            if index < lines.count {
                return String(lines[index])
            } else {
                return String(repeating: " ", count: lines.first?.count ?? 0)
            }
        }
        
        let spacesBetween = String(repeating: " ", count: amount)
        
        for i in 0..<maxLines {
            let lineB = getLine(lines1, index: i)
            let lineF = getLine(lines2, index: i)
            print("    " + lineB + spacesBetween + lineF)
        }
    }
}
