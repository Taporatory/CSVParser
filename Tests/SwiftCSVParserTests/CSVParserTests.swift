import XCTest
@testable import CSVParser

class CSVParserTests: XCTestCase {
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    let fileManager = FileManager.default
    
    // Get current directory path
    
    let path = fileManager.currentDirectoryPath
    print(path)
    
    do {
      var csv = try CSVParser(filePath: "/Users/Nero/Desktop/quotes.csv")

      let content = csv.content
      let index = content.characters.index(of: "\r")
      print(index)

      
      for line in csv {
        print(line)
      }
      for line in csv.content.lines() {
        print(line)
      }
      print(csv[4])
      
    }catch let error {
      print(error)
      
    }
  }

  func testPerformance() {
    measure {
      
      let csv = try! CSVParser(filePath: "/Users/Nero/Desktop/large.csv")

      for _ in csv {
        
      }
    }
    
  }

  
  static var allTests : [(String, (CSVParserTests) -> () throws -> Void)] {
    return [
      ("testExample", testExample),
    ]
  }
}
