//: Playground - noun: a place where people can play

import Cocoa

/**
*  for 循环
*/
for fanny in 5..<10 {
    print("fanny is \(fanny)")
}

//3 的 10 次幂
//你可以使用下划线（_）替代变量名来忽略对值的访问
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}

for mi in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
// 输出 "3 to the power of 10 is 59049"

var names = ["ddd", "fanny", "laodao", 33]
for name in names {
    print("holle, \(name)")
}
//c 语言方式 注: i++ 改为 ++i
var index: Int
for index = 0; index < 3; ++index {
    print("index is \(index)")
}
// index is 0
// index is 1
// index is 2
print("The loop statements were executed \(index) times")
// 输出 "The loop statements were executed 3 times


/*
* while 循环 
* while循环，每次在循环开始时计算条件是否符合；
* repeat-while循环，每次在循环结束时计算条件是否符合。
*/

var finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
//while square < finalSquare {
//    // 掷骰子
//    if ++diceRoll == 7 { diceRoll = 1 }
//    // 根据点数移动
//    square += diceRoll
//    if square < board.count {
//        // 如果玩家还在棋盘上，顺着梯子爬上去或者顺着蛇滑下去
//        square += board[square]
//    }
//    
//    print(diceRoll, square)
//}
//print("Game over!")


/**
*  repeat while
*  它和while的区别是在判断循环条件之前，先执行一次循环的代码块，然后重复循环直到条件为false。
*/
repeat {
    // 顺着梯子爬上去或者顺着蛇滑下去
    square += board[square]
    // 掷骰子
    if ++diceRoll == 7 { diceRoll = 1 }
    // 根据点数移动
    square += diceRoll
    print(diceRoll, square)
} while square < finalSquare
print("Game over!")



/**
*  switch case
*/

let someCharacter : Character = "f"
switch someCharacter {
case "a", "e", "i", "o", "u" :
    print("元音vowel is \(someCharacter)")
    case "b", "c", "d", "f", "g", "h", "j", "k", "n", "m", "l", "p", "q", "w", "v", "z", "x", "u", "y":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}


let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// 输出 "There are dozens of moons orbiting Saturn."


/**
*      1) tupel  元祖
*/

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}
// 输出 "(1, 1) is inside the box"

/**
*   2)  不存在隐式的贯穿
*/
//let anotherCharacter : Character  = "a"
//switch anotherCharacter {
//case "A" ://当条件没有语句时直接往下是错误的 要么添加一个语句 要么添加break
//case "a" :
//    print("anotherCharacter is  \(anotherCharacter)")
//case "b" :
//    print("anotherCharacter is  \(anotherCharacter)")
//}


/**
*    3)   值绑定
*/
let anotherPoint = (0, 66)
switch anotherPoint {
case (let x, 0):
    //当Y为0时, 则把横轴赋值给x
    print("on the x-axis with an x value of  xxxx  \(x)")
case (0, let y):
    //当X为0时,则把纵轴赋值为y
    print("on the y-axis with a y value of yyyy  \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// 输出 "on the x-axis with an x value of 2"


/**
*    4) case where
*/
let point = (2, -2)
switch point {
case let (x, y) where y == -2:
    print("xxxxxxxxxxxxxxxxxxx ")
case let (x, y) where y == -x:
    print("yyyyyyyyyyyyyyyyy")
case let (x, y):
    print("xxxxxxxxxxxxxxxxxxyyyyyyyyyyyyyyyyy")
}


/**
*  控制转移语句
*   continue
*   break
*   throw
*   fallthrough
*   return
*/

//continue
let puzzleInput : String = "great minds think alike"
var puzzletOutput = ""
for character in puzzleInput.characters {
    switch character {
        case "f", "e", "n", "i":
        continue
//        break
    default:
        puzzletOutput.append(character)
    }
}
print("\(puzzletOutput)")

/**
*  fallthrough  swift 不像oc那样 不会从上一个case分支落入到下一个分支 只要第一个匹配到的 case 分支完成了它需要执行的语句，整个switch代码块完成了它的执行。相比之下
*   如果你确实需要 C 风格的贯穿的特性，你可以在每个需要该特性的 case 分支中使用fallthrough关键字。下面的例子使用fallthrough来创建一个数字的描述语句。 
*   falltheough 是需要特性 特别 实现的cass 在要特别加入的case的前一个cass里使用falltheough   即 用falltheough来贯穿到下一个条件中 不论下一个条件是否匹配 正确
*/


let integerToDescribe = 5
var description = "the number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 11,13, 22, 19:
    description += "a prime number , and also"
    
case 10:
    description += "只加一个 10"
    fallthrough
default :
    description += "an integer"
}
print("description is \(description)")



////带标签的语句 上面的蛇和梯子游戏
// finalSquare = 25
////var board = [Int](count: finalSquare + 1, repeatedValue: 0)
//board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
//board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
////var square = 0
////var diceRoll = 0
//gemeover: while square != finalSquare {
//    if ++diceRoll == 7 { diceRoll = 1 }
//    switch square + diceRoll {
//    case finalSquare:
//        // 到达最后一个方块，游戏结束
//        break gemeover
//    case let newSquare where newSquare > finalSquare:
//        // 超出最后一个方块，再掷一次骰子
//        continue gemeover
//    default:
//        // 本次移动有效
//        square += diceRoll
//        square += board[square]
//    }
//}
//print("Game over!")


/**
*  检测API是否可用
*/

var dddddd = "hi everybady 跟我一起嗨嗨嗨!"
var ssssss = ""
if #available(iOS 9, OSX 10.10, *){
    print("osx")
}else{

}


/**
*  元祖
*/
let total = 21.19
let taxPct = 0.06
let subtotal = total / (taxPct + 1)
func calcTipWithTipPct(tipPct:Double) -> (tipAmt:Double, total:Double) {
    let tipAmt = subtotal * tipPct
    let finalTotal = total + tipAmt
    return (tipAmt, finalTotal)
}
calcTipWithTipPct(0.20)

//定义
let (x, y) = (3, 5)

//访问
// 同时访问元祖的x值和y值

let http404Error1 :(Bool, Int, String) = (true, 200, "not found")
//key:value
let http404Error2 = (isSuccess:true, code:200, error:"not found")

let http404Error = (404, "not found")
let (statusCode, statusMessage) = http404Error
print("statusCode is \(statusCode)  statusMessage is \(statusMessage)")

//如果仅需要元组中x值或y值, 可以使用"_"的方式来忽略不需要的值
let (justTheStatusCode, _) = http404Error

//访问元组的值, 使用序号
print("statusCode is \(http404Error.0)  statusMessage is \(http404Error.1)")

let http200Status = (statusCode: 200, message: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status msg is \(http200Status.message)")


let (statustr, codestr, errorstr) = http404Error2
print(statustr,codestr, errorstr)



