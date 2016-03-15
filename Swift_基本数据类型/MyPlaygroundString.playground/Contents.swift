//: Playground - noun: a place where people can play

import Cocoa

//var str = "Hello, playground"
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

suoyinstring.startIndex  //起始下标  0
suoyinstring.endIndex        //结束下标  23
var i      = suoyinstring.startIndex.successor() //下标的前后移动
i = suoyinstring.startIndex.advancedBy(5)
suoyinstring.endIndex
suoyinstring[i]  //通过Index能直接拿到字符
suoyinstring.characters[i]   //第二种方法
i          = i.advancedBy(2)        //起始位之后3个字符，即第四个字符
var iii = i.distanceTo(suoyinstring.endIndex)
print(iii)
Array(suoyinstring.utf8.enumerate())
Array(suoyinstring.utf16.enumerate())
Array(suoyinstring.unicodeScalars.enumerate())
Array(suoyinstring.nulTerminatedUTF8)

suoyinstring.uppercaseString
suoyinstring.lowercaseString
suoyinstring.capitalizedString


//类型强转
var ssss = "3536"
let n      = Int(ssss)!
var numneeeee = 34567
let sreinffff = String(numneeeee)
String("the number is \(n)")
String(format:"%.2f,  %d", 9.1, 304)

// index   range  都不是直接的数字
let offset = suoyinstring.startIndex.advancedBy(2)// offset: 3rd char
let range  = Range(start: suoyinstring.startIndex.advancedBy(3), end: suoyinstring.endIndex.advancedBy(-2))// range: 3..<6, "345"

//删除和部分删除
var str = "fanny is buetiful girl haha  looking for her love"
str.removeRange(range)
str.removeAtIndex(offset)
String(str.characters.dropFirst())
String(str.characters.dropFirst(3))
String(str.characters.dropLast())
String(str.characters.dropLast(3))
//以上对character的操作不改变原来的值！
//// 删除头尾空白字符
//" I love you ".stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
//// 删除头尾字符集 要删除的字符  只能是头和尾且紧挨着的 直到没有 比如, . o !
//"o- I love you, too!".stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: ",. -  o !"))
////清空
//str.removeAll()

//获取固定字符串
str.substringFromIndex(offset)
str.substringToIndex(offset)
str.substringWithRange(range)

//分割
str        = "<123, test2,???>   <测试: 数据  .>"
// 用固定字符分割
str.componentsSeparatedByString(" ")
// 用固定字符集分割
str.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: ", ."))


func toString<T>(a: T) -> String{
    // Way one, format
    //return "\(a)"
    // Way two, new string
    return String(a)
}
toString(123)
toString(0.007)
toString([4, 8, 32, 5 ])
toString("test".startIndex)


Int("123")
Float("3.1")


// Way 1, 格式化转String
String(format:"%i,  0x%x,  0o%o,  %.2f", 31, 31,  31, 3.1)
// Way 2
String().stringByAppendingFormat("%x",31)
String().stringByAppendingFormat("%o",31)

//十六进制String转整数
var res:UInt32   = 0
NSScanner.localizedScannerWithString(str).scanHexInt(&res)
print(str)


var string = "测试"
var data : NSData?
var nstr : NSString?
var url : NSURL?

nstr = string
string = String(nstr)


let utf8str = str.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())!
nstr = utf8str
url = NSURL(string: utf8str)
url = NSURL(string: String(nstr!))

data = str.dataUsingEncoding(NSUTF8StringEncoding)
data = nstr?.dataUsingEncoding(NSUTF8StringEncoding)
data = url?.absoluteString.dataUsingEncoding(NSUTF8StringEncoding)


let byte :[UInt8]    = [0xe4, 0x8d, 0xa9, 0x20, 0xe3, 0x8e, 0x8f]
data                 = NSData(bytes: byte, length: byte.count)
str = String(data: data!, encoding: NSUTF8StringEncoding)!
nstr = NSString(data: data!, encoding: NSUTF8StringEncoding)
if #available(OSX 10.11, *) {
    url = NSURL(dataRepresentation: data!, relativeToURL: nil)
} else {
    // Fallback on earlier versions
}



/**
*  正则表达式
*/

let zhengzestr = "18800002222---13144445555"
let pattern = "1[3|5|7|8][0-9]\\d{8}"






/**
*  
+ (NSString *)valiMobile:(NSString *)mobile {

if (mobile.length < 11) {
return @"手机号长度只能是11位";
} else {
/**
* 移动号段正则表达式
*/
NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
/**
* 联通号段正则表达式
*/
NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
/**
* 电信号段正则表达式
*/
NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
BOOL isMatch3 = [pred3 evaluateWithObject:mobile];

if (isMatch1 || isMatch2 || isMatch3) {
return nil;
} else {
return @"请输入正确的电话号码";
}
}

return nil;
}

*/
