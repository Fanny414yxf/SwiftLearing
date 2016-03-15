//: Playground - noun: a place where people can play

import Cocoa

/**
* 
*   闭包表达式（Closure Expressions）
*   尾随闭包（Trailing Closures）
*   值捕获（Capturing Values）
*   闭包是引用类型（Closures Are Reference Types）
*
*   闭包的3种形式:
    全局函数是一个有名字但不会捕获任何值的闭包
    嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
    闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包
*
*   闭包优点:
    利用上下文推断参数和返回值类型
    隐式返回单表达式闭包，即单表达式闭包可以省略return关键字
    参数名称缩写
    尾随（Trailing）闭包语法
*
*
*/


let names = ["fanny", "rlin", "xiaolin", "ahui", "piggg"];

func backforword(string1: String, string2: String) -> Bool {
    return string1 < string2
}

var revered = names.sort(backforword)
revered = names.sort()//sort()函数默认是升序

/**
*   1) 闭包表达式语法
*  闭包表达式语法可以使用常量、变量和inout类型作为参数，不提供默认值。 也可以在参数列表的最后使用可变参数。 元组也可以作为参数和返回值
*  一般形式:
    { (parameters) -> returnType in
       statements
    }
*
*   闭包表达式语法可以使用常量、变量和inout类型作为参数，不提供默认值。 也可以在参数列表的最后使用可变参数。 元组也可以作为参数和返回值。
*
*/

//闭包的函数体部分由关键字in引入。 该关键字表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始。
revered = names.sort({(s1: String, s2: String) -> Bool in
    return s1 > s2
})

//跟简短的一行代码
revered = names.sort({(string1: String, string2: String) -> Bool in return string1 > string2})
print(revered)


/**
*    2) 根据上下文推断类型
*/

revered = names.sort({(s1, s2) in return s1 > s2})
print("根据上下文推断类型 \(revered)")

var numbers = [22, 11, 2, 45, 7, 9, 10]
var numberresult = numbers.sort({n1, n2 in return n1 < n2})
print("测试根据上下文推断类型------\(numberresult)")


/**
*    3) 单表达式闭包隐式返回   单行表达式闭包可以通过隐藏return关键字来隐式返回单行表达式的结果
*   表达式只有一个返回结果 返回没有歧义,因此可以隐藏return
*
*/
numberresult = numbers.sort({s1, s2 in s1 < s2})


/**
*    4)  参数名称缩写（Shorthand Argument Names）
*    Swift 自动为内联函数提供了参数名称缩写功能，您可以直接通过$0,$1,$2来顺序调用闭包的参数。
*    如果您在闭包表达式中使用参数名称缩写，您可以在闭包参数列表中省略对其的定义，并且对应参数名称缩写的类型会通过函数类型进行推断。 in关键字也同样可以被省略，因为此时闭包表达式完全由闭包函数体构成：
*/
//在这个例子中，$0和$1表示闭包中第一个和第二个String类型的参数。

numberresult = numbers.sort( { $0 > $1 } )
print("参数名称缩写--\(numberresult)")



/**
*    5)  运算符函数  直接根据所给的运算符进行排序
*/

numberresult = numbers.sort(>)


/**
*    6) 尾随闭包
*/

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbersssss = [16, 58, 510]
let strings = numbersssss.map {
    (var number) -> String in
    print("number \(number)")
    var output = ""
    while number > 0 {
        //因此叹号可以用于强制解析 (force-unwrap) 存储在可选下标项中的String类型值。
        output = digitNames[number % 10]! + output
        number /= 10
        print("number \(number)----------output \(output)")
    }
    return output
}
print("尾随闭包__________\(strings)")
// strings 常量被推断为字符串类型数组，即 [String]
// 其值为 ["OneSix", "FiveEight", "FiveOneZero"]



/**
*    7) 捕获  
*    闭包可以在其定义的上下文中捕获常量或变量。 即使定义这些常量和变量的原域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
*    Swift最简单的闭包形式是嵌套函数，也就是定义在其他函数的函数体内的函数。 嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量。
*/
func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

/**
*  makeIncrementor  返还值为函数 () -> Int 返回了incrementor()函数
*  incrementor并没有传入参数  通过捕获函数体内的变量runningTotal 和 变量amount的引用, 当makeIncrementor调用完了之后runningTotal amount 都不会被释放, 当再次调用incrementor()函数是里面的结果会继续增
*
*/
var incrementor = makeIncrementor(forIncrement: 3)
//incrementByTen 是调用makeIncrementor 返回的函数
let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen()
// 返回的值为10
incrementByTen()
// 返回的值为20
incrementByTen()
// 返回的值为30
print("incrementor is \(incrementor())   incrementByTen is \(incrementByTen())")

/// makeIncrementor  返回的是一个函数   
// 所以 incrementor  incrementByTen  都是一个函数 要调用就用这种形式incrementByTen()
let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven()
// 返回的值为7
incrementBySeven()
// 返回的值为14



 /// 闭包引用类型 
//无论您将函数/闭包赋值给一个常量还是变量，您实际上都是将常量/变量的值设置为对应函数/闭包的引用。 上面的例子中，incrementByTen指向闭包的引用是一个常量，而并非闭包内容本身。

//这也意味着如果您将闭包赋值给了两个不同的常量/变量，两个值都会指向同一个闭包：

//将闭包赋值给一个常量 但是这个闭包仍然在引用,所以闭包的值仍然增加10
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
// 返回的值为50
//输出时仍在引用 所以输出值为 60
print(alsoIncrementByTen())




