//: Playground - noun: a place where people can play

import Cocoa



/**
 *  可选类型 类型后面加      ?
 *  可变类型 类型后面加      ...    函数中只能有一个可变参数 规范写法一般把可变类型写在最后
 *  变量参数 参数名前面加    var
 *  输入输出参数 参数名前加   inout
 *  注: 用了inout 后面就不能跟 var 或者 let,  但是inout传入的参数必须变量var, 且用取址符&修饰
 *
 */

/**
*   函数 
*   func 函数名(参数名:参数类型) -> 返回类型 {}
*/

func sayHello(personName: String) -> String {
    let grerting = "hello," + personName
    return grerting
}
sayHello("Fanny")


//多参数函数
func openRangeLenth(start: Int, end: Int) -> Int {
    return end - start
}
openRangeLenth(3, end: 10)


//莫有参数
func noparameter() -> String {
    return "no no no no fanny"
}
print(noparameter())


func sayHello(personname: String, readgreeted: Bool) -> String {
    if readgreeted {
        return sayHello("fanny")
    }else{
        return noparameter()
    }
}
sayHello("hhahh", readgreeted: true)

//无返回值
func goodbye(perssonname: String)() {
    print("goodbye! \(perssonname)")
}
goodbye("my love")


func printAndCount(stringToPoint: String) -> Int {
    print(stringToPoint)
    return stringToPoint.characters.count
}

func printWithoutCount(stringToPoint: String) {
    printAndCount(stringToPoint)
 /// 注: 调用函数1 输出语句会调用,但是由于本函数没有返回值 所以返回值不会被用到
}

var haha =  printAndCount("hello, world")
var haha1 = printWithoutCount("hello, world")//没有返回值 所以 haha1为()



/**
*  多重返回值函数
*/

func maxAndMin(array: [Int]) -> (max: Int, min: Int)? {
    var tempMax = array[0];
    var tempMin = array[0];
    for value in array {
        if value > tempMax {
            tempMax = value
        }else if value < tempMin {
            tempMin = value
        }
    }
    return (tempMax, tempMin)//直接返回一个元祖类型
}

let numbers: [Int] = [2, 4, 6, 12, 88, -1, -11]
print(maxAndMin(numbers))
if let result = maxAndMin(numbers) {
    print("max is \(result.max)  min is \(result.min)")
}
//注: 返回的元祖中可能没有值 即为nil, 那么返回值后面可添加?表示可选类型   那么用result 接收返回值的时候用上if来判断一下是否为满足条件 不为nil则可输出语句


//函数参数名称
//函数参数都有一个外部参数名(external parameter name)和一个本地参数名(local parameter name).外部参数名用来标记传递给函数调用的参数,本地参数名在实现函数的时候使用.

//般情况下,第一个参数省略其外部参数名,第二个以后的参数使用其本地参数名作为自己的外部参数名.所有参数需要有不同的本地参数名,但可以共享相同的外部参数名.
func somefunc(firstParameter: String, secondParameter: String) {
    if firstParameter == secondParameter {
        print(" yiyangdeo")
    }else{
        print("bushiyiyangde")
    }
}
somefunc("Rlin", secondParameter: "fanny")

//你可以在本地参数名前指定外部参数名,中间以空格分隔. 
//如果提供了外部参数名 那么使用的时候必须用外部参数名
func someFunction(externalParameterName localParameterName: Int) {
    // function body goes here, and can use localParameterName
    // to refer to the argument value for that parameter
}
func goShip(name person1: String, person2: String, goplace placename: String, doing ship: String) -> String {
    let result = "\(person1) 和 \(person2) 一起去 \(placename) \(ship)"
    return result
}

print(goShip(name: "fanny", person2: "Rlin", goplace: "佳慧超市", doing: "买好多好多好吃的!"))

//想省略第二个参数的外部参数名 则可用 _ 下滑线 在本地参数名前加上 _
func yong_daiti(string1: String, _ string2: String) {
    
}
yong_daiti("Rlin", "fanny")

//默认参数值
func defaultParameter(defaultParameter: Int = 12) -> Int {
    return defaultParameter
}

print(defaultParameter(), defaultParameter(5))

// 可变参数  在参数类型名后面加上 ... 即表示这个参数为可变参数 
//注:一个函数中最多1个可变函数, 规范书写: 可变函数一般写在最红
func arithmeticMean(numbers: Double...) -> Double {
    var totol: Double = 0
    for value in numbers {
        totol += value
    }
    let arithmetic = totol / Double(numbers.count)
    return arithmetic
}

arithmeticMean(3, 3, 3, 3, 3, 3)
arithmeticMean(1.4, 2.0, 3, 4.1)

//变量参数 
func parameters(var par1: String, var par2: String, num: Int, cha: Character) {
    print("有没有错")
}
parameters("fanny", par2: "lili", num: 5, cha:  "*")

func alignRight(var string: String, totalLength: Int, pad: Character) -> String {
    let amountToPad = totalLength - string.characters.count
    if amountToPad > 1  {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}
let originalString = "hello"
let paddedString = alignRight(originalString, totalLength: 10, pad: "*")
// paddedString is equal to "-----hello"
// originalString is still equal to "hello"


/**
*  输入输出参数    如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在
*  定义: 在参数名前添加一个 inout 
*  用法:  参不能为常量或者字面量  当传入的参数作为输入输出参数时，需要在参数前加取址&符，表示这个值可以被函数修改
*  注意： 输入输出参数不能有默认值，而且可变参数不能用 inout 标记。如果你用 inout 标记一个参数，这个参数不能被 var 或者 let 标记。
*/

//用了inout就不能用var 或者 let
func swapToInts(inout a: Int, inout _ b: Int) {
    let temp = a
    a = b
    b = temp
}

var a = 5, b = 10
//传入的参数只能为变量
swapToInts(&a, &b)
print("\(a), \(b)")
//函数类型 上面就是 2个int类型的参数没有返回值


func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b
}
//使用函数类型 :2个int类型的参数返回1个int类型的值 可以用来赋值
var mathFunction: (Int, Int) -> Int = addTwoInts



//函数作为参数类型的函数
func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)// prints "Result: 8"

func functionWithParameterFunc(function:(Int, Int) -> Int, _ a: Int, _ b: Int) -> Int {
    return function(a, b)
}
print("-------------\(functionWithParameterFunc(multiplyTwoInts, 3, 5))")



//函数类型作为返回类型（Function Type as Return Types）
func setforward(input: Int) -> Int {
    return input + 1
}

func setbackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? setbackward : setforward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function
print(moveNearerToZero)


print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// 3...
// 2...
// 1...
// zero!


/*
* 在这之前都是全局函数
* 嵌套函数
* 你也可以把函数定义在别的函数体中，称作嵌套函数（nested functions）。
*/
func chooseStepFunction1(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
    //直接返回了函数
}
var currentValue1 = -4
let moveNearerToZero1 = chooseStepFunction(currentValue1 > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue1 != 0 {
    print("\(currentValue1)... ")
    currentValue1 = moveNearerToZero1(currentValue1)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!
