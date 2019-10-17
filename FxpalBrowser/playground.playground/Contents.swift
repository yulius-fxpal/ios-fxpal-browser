import UIKit

var str = "Hello, playground"
1+1

func fibonacci(n: Int) -> Int {
    // Some temporary variables.
    var a = 0
    var b = 1
    // Add up numbers to the desired iteration.
    for _ in 0..<n {
        let temp = a
        a = b
        b = temp + b
    }
    return a
}
for i in 0..<10 {
    let result = fibonacci(n:i)
    print("fib \(i) = \(result)")
}

//class Object {
//    var name:String
//
//    init() {
//        self.name = "???"
//    }
//    func speak() {
//        print("i can't speak")
//    }
//}

protocol Object {
    func speak()
}

class Dog: Object{
    var name:String
    init(name:String) {
//        super.init()
        self.name = name
    }
    
    func speak() {
        print("\(self.name): woof")
    }
}

class Person: Object {
    var name:String
    var age:Int
    
    init(name:String, age:Int) {
        self.age = age
//        super.init()
        self.name = name
    }

    func speak() {
        print("\(self.name): I say good day to you sir!  I am \(age) years old.")
    }

}

Dog(name:"Fido").speak()
Person(name:"John", age: 25).speak()

let fruits = ["apple", "oranges", "bananas"]
for (index, fruit) in fruits.enumerated() {
    print(index, fruit)
}

let employees = [
    "alice": "dept1",
    "bob": "dept2",
    "charlie": "dept3"
]
for (key,value) in employees {
    print(key, value)
}

var foo:String? = nil

if let f = foo {
    print("foo is guarantted to not nil -> \(f)")
} else {
    print("foo is nil")
}

//guard let f = foo else {
//    print("f is nil")
//    throw Error.
//}
//print(f)


struct GroceryProduct: Codable {
    var name: String
    var points: Int
    var description: String?
}

let json = """
{
    "name": "Durian",
    "points": 600,
    "description": "A fruit with a distinctive scent."
}
""".data(using: .utf8)!


let decoder = JSONDecoder()
let product = try decoder.decode(GroceryProduct.self, from: json)
print(product)

