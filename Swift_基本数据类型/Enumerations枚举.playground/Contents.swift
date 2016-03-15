//: Playground - noun: a place where people can play

import Cocoa
/**
*  枚举语法（Enumeration Syntax）
*  匹配枚举值与Swith语句（Matching Enumeration Values with a Switch Statement）
*  相关值（Associated Values）
*  原始值（Raw Values）
*  递归枚举（Recursive Enumerations）
*
*  如果给枚举成员提供一个值（称为“原始”值），则该值的类型可以是字符串，字符，或是一个整型值或浮点数。
*
*/

// 用关键字 enum + case 每个成员之间换行,不用逗号
enum CompassPoint {
    case North
    case South
    case East
    case West
}
//所有成员写在一行,用逗号隔开
enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

var directionToHead = CompassPoint.East
//directionToHead的类型可以在它被CompassPoint的一个可能值初始化时推断出来。一旦directionToHead被声明为一个CompassPoint，你可以使用一个缩写语法（.）将其设置为另一个CompassPoint的值：
directionToHead = .West
//注意; 这种省略方式是因为directionToHead之前已经赋值过了,知道directionToHead的类型是CompassPoint,则可以直接点语法
//var dicretion = .East//错误


//   1 匹配枚举值和switch语句
//注:在switch 在判断一个枚举类型时, switch必须穷举完所以情况,否则会报错
switch directionToHead {
case .South:
    print("direction to South")
case .North:
    print("dicection to North")
case .East:
    print("dicetion to East")
case .West:
    print("dicetion to West")
}

directionToHead = .East
//若不想穷举完所以情况 则可以用默认default分支来涵盖所有未明确被提出的枚举成员
switch directionToHead {
case .West:
    print("direction to west")
default:
    print("暂时没有方向")
}

//   2 相关值
enum Codebar {
    case UPCA(Int, Int, Int, Int)
    case QRcode (String)
}

var codebar = Codebar.UPCA(8, 2342543, 342535, 3)
codebar = .QRcode("FSDGSGSHSGSFDBXDFHGFHHER")
print("codebar is \(codebar)")

//如果一个枚举成员的所有相关值被提取为常量，或者它们全部被提取为变量，为了简洁，你可以只放置一个var或者let标注在成员名称前：
switch codebar {
case let .UPCA(numberSystem, manufacturer, product, check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .QRcode(codebar):
    print("QR code: \(codebar).")
}
// 输出 "QR code: ABCDEFGHIJKLMNOP."


 ///z注:  枚举的rawValue改为hashValue
let earthsOrder = Planet.Earth.hashValue
// earthsOrder 值为 3

let sunsetDirection = CompassPoint.West.hashValue
// sunsetDirection 值为 "West"




/*
*  递归 + 表达式  枚举
*/
enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}


indirect enum ArithmeticExpressionTop {
    case Number(Int)
    case Addition(ArithmeticExpressionTop, ArithmeticExpressionTop)
    case Multiplication(ArithmeticExpressionTop, ArithmeticExpressionTop)
}

//该函数如果遇到纯数字，就直接返回该数字的值。如果遇到的是加法或乘法元算，则分别计算左边表达式和右边表达式的值，然后相加或相乘。
//func evaluate(expression: ArithmeticExpressionTop) -> Int {
//    switch expression {
//    case .Number(let value):
//        return value;
//    case .Addition(let nub1, let nub2):
////        return nub1 + nub2;//error
//        return evaluate(nub1) + evaluate(nub2)
//    case .Multiplication(let nub1, let nub2):
//        return evaluate(nub1) * evaluate(nub2)
//    }
//}


func evaluate(expression: ArithmeticExpressionTop) -> Int {
    switch expression {
    case .Number(let value):
        return value;
    case .Addition(let nub1, let nub2):
        //        return nub1 + nub2;//error
        return evaluate(nub1) + evaluate(nub2)
    case .Multiplication(let nub1, let nub2):
        return evaluate(nub1) * evaluate(nub2)
    }
}


let numA = ArithmeticExpressionTop.Number(2)
let numB = ArithmeticExpressionTop.Number(5)
let sun = ArithmeticExpressionTop.Addition(numA, numB)
let ji = ArithmeticExpressionTop.Multiplication(sun, ArithmeticExpressionTop.Number(2))
print("sun is \(evaluate(sun))  \n ji is \(ji)  \n evaluate is \(evaluate(ji)) ")