//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
* 存储属性
* 计算属性
* 属性观察器
* 全局变量和局部变量
* 类型属性
*/

//结构体的存储属性
struct FixedLengthRang {
    var firstValue: Int
    let length: Int
}
var rangOfThreeItems = FixedLengthRang(firstValue: 0, length: 3)//该区间表示0. 1. 2
rangOfThreeItems.firstValue = 5 //该区间表示5.6.7
//rangOfThreeItems.length = 4 //length为为常量所以会警报


/*
* 延缓存储属性：延缓属性是指第一次被调用的时候才会计算初始值的属性
* 注意：延缓属性必须为变量，即用var关键字
*/
class DataImporter {
    var fileName = "data.tet"
    
}

class  DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}


let manager = DataManager()
manager.data.append("some data")// manager.importer没有被创建
print(manager.importer.fileName)// manager.improter在使用时才被创建



/*
*   计算属性
*   除存储属性外，类，结构体和枚举都可定义为计算属性，计算属性不直接存储值，而是提供一个getter和一个可选的setter，来间接获取和设置其他属性变量的值
*
*
*/
struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center : Point {
        get {
            //通过坐标和size获取中心点
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
//若计算属性的setter没有定义表示新值得参数名，则可以默认使用newValue
//        set {
//            // 根据center计算坐标
//            origin.x = newValue.x - (size.width / 2)
//            origin.y = newValue.y - (size.height / 2)
//        }
        set  (newCenter) {
            // 根据center计算坐标
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }

    }
}

var square = Rect (origin: Point(x: 0, y: 0), size: Size(width: 10, height: 10))
let initialSquareCenter = square.center
square.center = Point(x: 15, y: 15)
print(square.origin.x, square.origin.y)


/*
*  只读计算属性
*   只有getter 没有 setter  的计算属性就是只读计算属性，总是直返一个值，通过点语法访问，但不能设置新值
*
*/
struct Cuboid {
    var width = 0.0, height  = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4, height: 5, depth: 2)
print("the volume of fourByFiveByTow is \(fourByFiveByTwo.volume)")



/*
*  属性观察器
*  监控和响应属性值的变化
*  通过重载的方式继承的 存储属性 计算属性 延迟存储属性来添加
*  注意：不需要为非重载的计算属性添加观察器，因为它的setter直接监控和响应值的变化

   willSet 在新的值被设置之前调用     默认名称 newValue
   didSet  在新的值被设置之后立即调用  默认名称  OldValue
*/


class StepCounter {
    var totalSteps: Int = 300 {
        
        willSet(newTotalSteps) {
        print("About to set totalSteps to \(newTotalSteps)")
        }
        
        didSet {
            //如果在一个属性的didSet观察器里为他赋值，这个值会替换该观察器之前的值
            totalSteps = 1000
            if totalSteps > oldValue   {
                print("added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 500



/*
* 全局变量：在函数、方法、闭包或任何类型之外定义的变量
* 局部变量：在函数、方法、闭包内部定义的变量
* 
*
*/



/*
*   类型属性：属于一个特定类型实例，每次类型实例化后都拥有自自己的一套属性值，实例之间的属性相互独立，不管类型有多少个实例，这些定义的属性都只有唯一一份
*
*   类型属性是作为类型定义的一部分写在类型最外层的花括号内，作用范围：在类型支持的范围内
*   用static定义类型属性，在为类定义计算类型属性时， 可用关键字class来支持自类对父类的实现进行重写
*   注意：必须给存储类型属性指定默认值 (类型属性字体是白色，属性字体是绿色)
*/

struct SomeStructure {
    static var storedTypeProperty = "some value"
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "some value" //存储类型
    static var computedTypeProperty: Int {  //计算类型在  这里的计算类型是只读的
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "some value"
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}


/*
*  获取和设置类型属性的值
*  通过点运算符访问，通过类型本身来获取和设置，而不是实例
*
*/

print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value"
print(SomeStructure.storedTypeProperty)
print("someenumeration.computedTypeProperty is \(SomeEnumeration.computedTypeProperty) -----------   SomeClass.overrideableComputedTypeProperty is \(SomeClass.overrideableComputedTypeProperty)")


struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        /*
        属性currentLevel包含didSet属性观察器来检查每次新设置后的属性值，它有如下两个检查：
        
        如果currentLevel的新值大于允许的阈值thresholdLevel，属性观察器将currentLevel的值限定为阈值thresholdLevel。
        如果前一个修正后的currentLevel值大于任何之前任意AudioChannel实例中的值，属性观察器将新值保存在静态类型属性maxInputLevelForAllChannels中。
        **/
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}


var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
