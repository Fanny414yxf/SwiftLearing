//: Playground - noun: a place where people can play

import Cocoa

/**

*
*  类和结构体对比
*  结构体和枚举是值类型
*  类是引用类型
*  类和结构体的选择
*  字符串(String)、数组(Array)、和字典(Dictionary)类型的赋值与复制行为
*
 
 共同点：
 1.定义属性用于值存储
 2.定义方法用于提供功能
 3.定义附加脚本用于访问值
 4.定义构造器用于生成初始值
 5.通过扩展增加功能
 6.协议
 
 类的附加点：
 1. 继承
 2。类型转换允许运行时检查和类的实例
 3.解构器允许一个类实例释放任何其所被分配的资源
 4.引用计数允许一个类多次引用
 
 注意：结构体是通过复制的方式运用，不要使用引用计数
 
 */
 
 
 //定义：分别是class struct 关键字，在大括号定义具体内容
 //类
struct Resolution {
    var width = 0
    var height = 0
}

//结构体
class	Videomode {
    var resolution = Resolution()
    var name = String()
    var gender = String()
    var interlaced = false
}



//生成示例和结构体 构造器语法，所以属性都会默认初始值
let someResolution = Resolution()
let someVidoemode = Videomode()
//通过点语法访问或赋值，子属性赋值
someVidoemode.name = "fanny"
someVidoemode.resolution.width = 30

//结构体成员逐一构造器,而类没有
var hd = Resolution(width: 3, height: 5)

//结构体的赋值只是一个拷贝，cinema是hd的拷贝副本，cinema和hd是两个完全不同的示例
var cinema = hd
cinema.width = 1080

print("hd width is \((hd).width)")
print(cinema.width)

//枚举也遵守相同的准则
enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    print("the remembered direction is still .West")
}



