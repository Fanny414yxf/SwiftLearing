//
//  main.swift
//  Swift_基本数据类型
//
//  Created by 杨晓芬 on 16/2/17.
//  Copyright © 2016年 Fanny. All rights reserved.
//

import Foundation

//print("Hello, World!")
//
//	///1. 初始化字符串
//	var empty = ""
//    var dddd = String()
//    var ssssssss: String = "烙下的一个"
//    var eeeee = String("冷成狗")
//
/////2. 输出语句  直接输出
//print(empty)
////"\+(内容)"
//    print("empty is \(empty)")
//    print("eeee eee  is ------\(ssssssss,eeeee)")
// print("eeee eee  is ------\(ssssssss)\(eeeee)")
//
////属性 isempty 判断是否为空字符
//if empty.isEmpty
//{
//    print("empty 是个 空字符串")
//}
//
//
/// 3 . 字符串可变性
//
//// 拼接字符串
//var fanny = "fanny chinessName is 杨晓芬"
//fanny += "haha 你个傻逼  怎么不多问问人家就答应了"
//
////fanny -= "多问问人家"//错误
//
//
//print("fannny is \(fanny)")
//
//
////for character in "Dog!🐶".characters {
//    print(character)
//}
//// D
//// o
//// g
//// !
//// 🐶
//
//let exclamationMark: Character = "!"
//let characterffff: Character = "空"
//error because 'characterffff' is not character
//let catCharacters: [Character] = ["C", "a", "t", "exclamationMark", "characterffff", "🐱"]
//let catString = String(catCharacters)
//print(catString, catCharacters)
//// 打印输出："Cat!🐱"
//
////





/*
字符串是值类型（Strings Are Value Types）
Swift的String类型是结构体类型，因此它是值类型。 如果创建一个新的字符串，那么当其进行常量、变量赋值操作，或在函数/方法中传递时会进行值拷贝。任何情况下都会对已有字符串值创建新副本，并对该新副本进行传递或赋值操作。

Swift默认字符串拷贝的方式保证了在函数/方法中传递的是字符串的值。我们可以明确拥有这个值，而不用管它来自哪里。 可确信传递的字符串不会被修改，除非自己去修改它。

在某些场景下，Swift编译器会优化字符串的使用，使实际的复制只发生在绝对必要的情况下，这意味着您将字符串作为值类型的同时可以获得极高的性能。

由于是值拷贝，而不是引用，因此我们将参数string传到参数中，在函数内部修改参数值，并不会影响外部的参数string，因此只是值的拷贝：
*/


//var string :String = "ddddddddddddddd"
//var str = "值拷贝"
//
////函数 : 函数名+圆括号(变量或常量 参数名 :参数类型) -> 返回值类型
//func testCopy(var str : String)//此时无返回数
//{
//    str += string//此时是值拷贝不是引用 所以外边的字符串并没有改变
//    print("这里是添加了新字符后的结果----- \(str)")
//}
//testCopy(str)
//
//print("看看是否改变了----- \(str)")
//
//var hahhahha = "你发生股份 "
//for (c, index) in hahhahha.characters.enumerate()
//{
//    print("c = \(c), index= \(index)")
//}
//
//print("\(string) \(str)")
//
//
////字符串索引
//string[string.startIndex]
////startIndex 字符串的一个位置  endIndex 是获取最后一位的下一个位置 successor()是获取下一个位置   predecessor()是获取前一个位置
//print("string.endIndex = \(string[string.startIndex])")  // d
//print("string.endIndex.successor() = \(str[str.startIndex.successor()])")   //考
//print("string.endIndex.predecessor() = \(str[str.endIndex.predecessor()])") // 贝
//
////advancedBy相对距离函数
//let index = hahhahha.startIndex.advancedBy(1)//第一个位置 advancedBy(1)在向后位移1一位即为第二位   发
//print("index.endindex.advanced by 4 \(hahhahha[index])")







////4.  连接字符串和字符
//let exclamationMark: Character = "!"
//var string1 = "fannnyang"
//var string2 = "🐱ffffff"
//
//var string3 = string1 + string2
//
//var instruction = "look over"
//instruction += string2
//// instruction 现在等于 "look over there"
//
//// 拼接字符串
//string3.append(exclamationMark)
//string3.appendContentsOf(string2)
//print(string3)


/**
*  
字符串字面量的特殊字符 (Special Characters in String Literals)

字符串字面量可以包含以下特殊字符：

转义字符\0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。
Unicode 标量，写成\u{n}(u为小写)，其中n为任意一到八位十六进制数且可用的 Unicode 位码。

*/

////wiseWords常量包含了两个双引号\"。 用\"内容\"表示
//let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
//let dddddddd = "\"ffffffffffffffffffffff\"fffffff"
//// "Imageination is more important than knowledge" - Enistein
//let dollarSign = "\u{24}"             // $, Unicode 标量 U+0024
//let blackHeart = "\u{2665}"           // ♥, Unicode 标量 U+2665
//let sparklingHeart = "\u{1F496}"      // 💖, Unicode 标量 U+1F496
//
//print("\(wiseWords) \(dollarSign) \(blackHeart) \(sparklingHeart)")
//
/////可扩展的字形群集  
//let eAcute: Character = "\u{E9}"                         // é
//let combinedEAcute: Character = "\u{65}\u{301}"          // e 后面加上  ́
//print(eAcute, combinedEAcute)
//
//
//let precomposed: Character = "\u{D55C}"                  // 한
//let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
//let enclosedEAcute: Character = "\u{E9}\u{20DD}"
//let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
//
//print("precomposed  = \(precomposed)   decomposed = \(decomposed)    enclosedEAcute = \(enclosedEAcute)    regionalIndicatorForUS = \(regionalIndicatorForUS)")
//


////5 ,插入字符串  (插入的字符 不能包括双引号" 反斜杠\ 回车 换行符)
//let number = 3
//var putinString  = "\(number)乘上2.5=\(number*3)"
//print("****************\(putinString.characters.count)")
//
//var hello = "hello"
//var world = "你个傻逼是傻吗***d逗比"
//
////插入字符
//hello.insert("你", atIndex: hello.endIndex)
//hello.insert("!", atIndex: hello.endIndex)
//
//print("hello 插入一个字符--------\(hello)")
//
////hello.insertContentsOf(["a","b"], at: hello.startIndex)//注意: hello.startIndex.predecessor()  这时会越界
////print("hello 插入一个字符组--------\(hello)")
////
////world.insertContentsOf("ni ge shaque hahahah ".characters, at: world.endIndex.predecessor())
////world.insertContentsOf("ni ge shaque hahahah ".characters, at: world.endIndex)
////
////print("world 插入一个字符串--------\(world)")
////
//////删除字符
////world.removeAtIndex(world.startIndex.successor())
////world.removeRange((world.startIndex.advancedBy(10)..<world.endIndex))
////print("删除一段字符串  \(world)")
////
////world.removeRange(Range(start: world.startIndex, end: world.endIndex))
////print("删除一段字符串  \(world)")
////
////world.removeAll()
////print("删除一段字符串  \(world)")
////
////let range = world.startIndex.advancedBy(6)..<world.endIndex
////world.removeRange(range)
////print("删除一段字符串-------  \(world)")
//////移除0到倒数第二个
////let range2 = world.startIndex.advancedBy(1)..<world.endIndex.advancedBy(-2)
////world.removeRange(range2)
////print("删除一段字符串-------  \(world)")



//访问 和 索引
let suoyinstring = "faFnny iDSd decoFDFosed"

let suoyin2 = "dfffdfd fdddddd  dss"

//比较2个字符是否相等
if suoyinstring == suoyin2
{
   NSLog("相等")
}else
{
    NSLog("不相等", 5)
}

suoyinstring[suoyinstring.startIndex]
print(suoyinstring)
suoyinstring[suoyinstring.endIndex.predecessor()]
print(suoyinstring)
suoyinstring[suoyinstring.startIndex.successor()]
print(suoyinstring)
let index = suoyinstring.startIndex.advancedBy(3)
print(suoyinstring)

//suoyinstring[suoyinstring.endIndex.predecessor()] // error
//suoyinstring[suoyinstring.endIndex.successor()]// error
//拼接字符串  并改为大小写
print("大写" + suoyinstring.uppercaseString, "小写 " + suoyinstring.lowercaseString)
//打印第一高个字符
print("charctet-------------- \(suoyinstring[suoyinstring.startIndex.successor()]) ----------\(suoyinstring[suoyinstring.endIndex.predecessor()]))");
print("-index------------- \(suoyinstring[suoyinstring.startIndex]))   \(index) " );
print("第7个字符为------\(suoyinstring[index])   index = \(index)")


////比较字符串
//var test1Str=""
//var test1Str2:String = String("sb二货");
////判断是否为空字符串
//print("test1Str" + (test1Str.isEmpty ? "没有值" : "有值"))
//
//print("test1Str2" + (test1Str2.isEmpty ? "没有值" : "有值"))
//
//var test5Str1="http://www.baidu.com"
//var test5Str2="icon.png"
////判断是否有前缀或后缀
//if test5Str1.hasPrefix("https://"){
//    print("好像是一个网址")
//}
//
//if test5Str2.hasSuffix(".png"){
//    print("好像是一个png图片 test5Str2的长度为 \(test5Str2.characters.count)   test1Str2的长度为 \(test1Str2.characters.count) )")
//}
//
//if test5Str1.containsString("www."){
//    print("\(test5Str1) 包含 www.")
//}



//var str = "范德萨Swif发的发生的事是大家可能能否上课"
//print("原始字符串：\(str)")
// ("Objective-Cand ".characters, atIndex: str.startIndex)
//print("插入字符串后：\(str)")
//
//str.insert(".",atIndex: str.endIndex)
//print("插入.字符后：\(str)")
//
////str.removeAtIndex(str.endIndex.predecessor())
////print("删除.字符后：\(str)")
//
//
//var startIndex = str.startIndex
//var endIndex = str.endIndex.predecessor()
//print(startIndex, endIndex)
//var range = startIndex...endIndex
//var strrnggn = "你wi yyyyyyy zgu"
////var range2 = Rang)
//str.replaceRange(range, with: "444")
////str.removeRange(range)
//
////strrnggn.removeAll()
//strrnggn.removeAtIndex(startIndex)
//print("str----------：\(str)   strrnggn______\(strrnggn))")
//
//
//str.replaceRange(range,with: "C++")
//print("替换范围后：\(str)")


//let yearStr = dob.substringWithRange(rangeOfYear)
//yearStr // "2000"






////if 判断条件语句
//let imtrueVar = true
//let imfalse = false
//if imtrueVar
//{
//    print("shuru is yes")
//}
//
////我的第一个swift函数
//var varandlet:Varandlet = Varandlet()
//varandlet.dddddd()
//
////三目运算符
//var a = 3
//var b = 50
//if a == 3
//{
//    print("a = \(a)")
//}else
//{
//    b = a
//    print("b = \(b)")
//}
//
//
//var result = a < b ? a : b
//print(result) // 50
//
//
////当条件可能为 nil  的时候 用 ?? 若为nil则返回后一个结果
//let defaultName = "标哥的技术博客"
//var customName: String?   //默认值为 nil
//var string = customName ?? "哈哈哈哈"
//print("?? 用法结果为  \(string)")
//
///*
//区间运算符
//..<
//...
//*/
//for index in 1...5 {
//    print("\(index) * 2  = \(index * 2)")
//}
//
////逻辑运算符
//var b =  true
//var a = true
//if (a && b)
//{
//    print("a he b dou budengyu nil dayin zheji ")
//}


/**
* 
1.熟悉Mac操作系统及Xcode开发工具的使用；
2.扎实的C/Object_C基础，熟练Object_C编程及iPhone SDK的使用；
3.掌握UDP/TCP/IP http等网络协议，XML/JSON解析；
4.熟悉数据存储，Sqlite数据库操作；
5.熟悉Cocoa touch框架和各种设计模式，内存管理及性能优化；
6.具有良好的编码风格和习惯。
*/


/**
*  项目名称: 没得比
责任描述：两人开发
项目简介：没得比是一个中立的,高性价比网购优惠商品推荐、分享的生活类应用，及时推送消息，分享国内外大型购物网站的各种折扣、优惠信息。用户可以按分类筛选来查看各种商品,商品信息及评论，可由商品的链接查看商品官网,同时可收藏和分享该商品, 可以晒出自己淘的宝贝,有图有文字有链接。可根据每次购买商品积累的铜币兑换各网站的优惠券。

项目名称：车优里教练版
责任描述：独立开发
项目简介：高校驾考团是一个学车服务平台，该项目主要是针对教练而设计的应用。主要是教练用于记录学员的约车情况，进行提醒约车，记录和更改学员的科目学习进度和科目缴费情况，与其它教练的技术、服务态度、拿证速度的排名，学员对教练的评价及回复。可以直接从通讯录导入学员，群发短信的形式通知通知各位学员。教练给出多种学车套餐，以供学员选择，还有科目学时累积记录和支付，学员更快获得驾照。教练可以为自己的服务贴上标签，方便学员选择,训练场地。

项目名称: 医广通
项目描述: 独立开发
项目简介: 一个医疗产品套餐代理应用，可以选择商品，代理推销套餐，在线咨询套餐，有患者到院代理便可以获得佣金；商品管理，删除代理商品，联系商品医院，复制链接，一键分享产品二维码到微信，QQ，微信，朋友圈，微博；管理订单，编辑预定人数，购买套餐患者到院情况，预定时间和到诊时间；绑定支付宝，记录你的每一笔收入和提现。

项目名称: 生活家家居
项目简介: 用于展示家居装饰公司设计的产品及装修服务的生活类应用。有3D立体图展示产品设计,可以细地观赏室内每一个细节设计,根据客户需求，比如装修风格，面积，等提供的装修方案来预算价格，活动期间可进行嗨款抢购,用户也可提供信息填单进行快速预约，装修材料展示说明, 工程进度跟踪,方便查看各个工程进度及实拍图，关于装修设计方面的一些疑问解答及建议,有什么疑问可以在线咨询或者直接致电客服。
*/


