//: Playground - noun: a place where people can play

import Cocoa

//空数组
var threeInt = [Int]()
threeInt = []
threeInt = [3, 4, 5, 5]

//结构体写法
threeInt = Array<Int>()
var anotherTheeeDouble = [Double]()

//有一个Int类型的元素3
threeInt.append(3)

//有3个int类型的元素3
threeInt = [Int](count: 3, repeatedValue: 3)

//有5个double类型的元素2.1
anotherTheeeDouble = [Double](count: 5, repeatedValue: 2.1)

var douuuble = [Double](count: 2, repeatedValue: 1.24)

//2个1.24 + 5个2.1
var newArray = douuuble + anotherTheeeDouble
var stringarr = ["fanny", "Rlin", "Hui", "Boss", "aFang", 4, 4]


///访问和修改数组
print("stringarr has \(stringarr.count) item")

//判断是否为空数组
//if stringarr.isEmpty {
if stringarr.count == 0 {
    print("stringarr is empth")
}else{
    print("stringarr is not empty")
}

//在数组末尾追加
var arrayAdd = ["ddd", 4]
//append 只能追加单个元素
arrayAdd.append("444")
//追加一个集合
arrayAdd.appendContentsOf(["fanny", "Rlin"])
//追加一个数组
arrayAdd += ["dddd"]

//arrayAdd.appendContentsOf(1...6)

// 插入元素
arrayAdd.insert("fanny", atIndex: 1)
arrayAdd.insert(["ssssss","fffff"], atIndex: 2)


//数组修改值
var array10items = [Int]()
for i in 1...10 {
    array10items.append(i)
}
print("array10items is \(array10items)")
//根据下标获取元素或修改元素 赋值
array10items[4] = 121212
array10items[2..<5]
array10items[2..<5] = [22,33,44]
array10items.replaceRange(2..<4, with:[222, 333])


//移除元素
let first = array10items.removeFirst()
//removeFirst() 情况1.后面加参数 则表示删除后的结果  情况2.后面不加参数 则表示删除的这个元素
array10items.removeFirst(1)//情况1
//移除第一个
array10items.removeFirst(first)
//全部移除并 但不释放内存,保留原来的容量空间
//array10items.removeAll(keepCapacity: true)
//移除2到4 3个元素
array10items.removeRange(2...4)
//移除前2个元素
array10items.removeFirst(2)

/**
*  遍历数组
*/
for item in array10items
{
    print("item is \(item)")
}

//获取下下标和元素
for (index, value) in array10items.enumerate() {
    print("index is \(index) value is \(value)")
}



//集合  无序 无重复
var favset : Set = Set<Int>()
favset = []
var stringSet : Set<String> = ["fanny", "lucy", "qq", "lili"]
//stringSet = ["fanny", "qq", "fanny", "qq", "qq"]


// 或者：
for value in favset.sort({ (a, z) -> Bool in
    return z > a // 由我们指定排序类型desc（降序）
}) {
    // milk
    // egg
    print("value is _______________\(value)")
}
// 或者直接使用sort无参数（默认为asc升序）
for value in favset.sort() {
    stringSet.count

    print("value is \(value)")
}



 /*
generate()
isSubsetOf<S
isStrictSubsetOf<S
isSupersetOf
isStrictSupersetOf<S
isDisjointWith<S
unionInPlace
subtract<S
subtractInPlace<S
intersect<S
intersectInPlace<S
exclusiveOr<
exclusiveOrInPlace<S
*/
var var1 : Set = [1, 3, 2, 5,  "分", "fan"]
var var2 : Set = [2, 3, "fan", 33, 12]

print("交集 is--------- \(var1.intersect(var2))")
print("并集 is---------- \(var1.union(var2))")
print("generate is------- \(var1.generate)")
print("isStrictSubsetOf is-------- \(var1.isStrictSubsetOf(var2))")
print("isSupersetOf is--------- \(var1.isSupersetOf(var2))")
print("isStrictSupersetOf is-------- \(var1.isStrictSupersetOf(var2))")
print("isDisjointWith is-------- \(var1.isDisjointWith(var2))")
print("subtract is------- \(var1.subtract(var2))")
print("subtractInPlace is-------- \(var1.subtractInPlace(var2))")
print("intersect is------- \(var1.intersect(var2))")



//字典
//1 Dictionary< value, key>()   注 :value 和 key 用 逗号
var dictionalry : Dictionary = Dictionary<String , String>()
print("dictionalry is \(dictionalry)")
//2. [key : value] 注 :value 和 key 用 冒号
var dictionalry2 = [Int : String]()
print("dictionalry2 is \(dictionalry2))")
dictionalry2 = [1 : "fanny", 2 : "lili", 3 : "qq", 4 : "ssss"]
dictionalry2 = [:]
print("dictionalry2 is \(dictionalry2))")


let value = dictionalry2[1]
if (value == nil) {
    print("value is \(value)")
} else {
    // 输入这行
    print("The key BB doesn\'t not exist in dict")
}



//增值或增加
//// 访问字典 索引元素
var dic = [1 : "fafaf", "fanny" : "string", ["ddd"]: "array"]
//怎样才行嘛 时间都浪费了
// 或者用API，如果不存在，则会增加，否则只是更新值
if let oldValue = dic.updateValue("Dog", forKey: "D") {
    print("The old value is \(oldValue)")
} else {
    // 输出这行
    print("The key D does\'t not exist before update \(dic)")
}

// 通过下标语法移除元素
dic["D"] = nil

// 或者通过调用removeValueForKey方法来移除
if let removedValue = dic.removeValueForKey("fanny") {
    print("The removed value is \(removedValue)")
} else {
    print("The key D doesn'\t exist in dict, can\' be removed.")
}

// 或者清空字典：
//dic.removeAll()


var dicbl = ["xiaom" : "xiaom", "fanny" : "fanny", 1 : "1", 3 : "d" ]
//遍历字典
for (value, key) in dicbl {
    print("value is  \(value) key is  \(key)")
}

for key in dicbl.keys {
    print(" \(key) : \(dicbl[key])")
}

for value in dicbl.values {
    print("\(value)")
}
//获取所有key 或 value 直接组成一个新数组
var keys = Array(dicbl.keys)
var values = Array(dicbl.values)




var fannynumber = [Int]()
fannynumber = []
fannynumber = [3, 4, 5, 5]



//15228913262
var rrrr = [Int]()
rrrr = [6, 2, 5, 3, 8, 9, 1]
var index = [Int]()
index = [6, 2, 1, 1, 4, 5, 6, 3, 1, 0, 1]

var tel = String()
for i in index {
   tel += String(rrrr[i])
}
print("fanny's tel is \(tel)")

