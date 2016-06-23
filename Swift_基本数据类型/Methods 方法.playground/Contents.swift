//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
*
*  实例方法
*  类型方法
*  类、结构体、枚举都可以定义实例方法和类型方法
*
*/

/*
*
* 实例方法
*
*/

class Counter {
    var count = 0
    //递增方法
    func increment() {
        ++count
    }
    //按一个指定的数递增
    func incrementBy(amount: Int) {
        count += amount
    }
    //重置为0
    func reset() {
        count = 0
    }
}

let counter = Counter()
for i in 0 ... 5 {
    counter.increment()
}
print(counter.count)
counter.increment()
counter.incrementBy(5)
print(counter.count)


/*
*  方法的局部参数名称 外部参数名称
*
*
*
*
*/