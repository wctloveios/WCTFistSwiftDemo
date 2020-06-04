//
//  ViewController.swift
//  WCTFirstSwiftDemo
//
//  Created by wct on 2020/6/4.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 2020-06-04
        // 1、定义常量用let、变量用var
        let str = "hello swift"
        let number = 100
        
        // 2、输出用print切可以直接无视格式，直接输出内容
        // 字符串拼接由%@占位符，直接替换成\()，括号中是参数名
        print(str)
        print("wvt learn swift")
        print("\(str) 打印拼接：\(number)")
        
        // 3、可以不适用；符号结尾，但是如果多个语句，需要使用；符号间隔
        print(str);print("wvt learn swift")
        
        // 4、空格需要有规律：运算符之间要不全部空格，要不都不要空格、等号之后需要空格，如果书写不正确，会直接提示error
        // let a= 1 + 2 编译不过: 变量后面不能直接跟等号
        // let a = 1 +2 编译不过：运算符前后空格b需要保持一致
        // let a = 1+ 2 编译不过：运算符前后空格b需要保持一致
        let a = 1+2
        let b = 1 + 2
        print(a);
        print(b);
        
        // 5、遍历写法改变
        for x in 0...10 {
            print(x);
        }
        
        // 6、类型变化：
        // int -> Int
        // float -> Float
        // double -> Double
        typealias newInt = Int
        typealias newFloat = Float
        typealias newDouble = Double
        
        // 7、类型别名（取个小名，人还是同个人）
        typealias newIntName = Int
        let changdu: newIntName = 1000
        print(changdu)
        
        // 8、类型安全（类型转换的时候会检查，不可转的时候回主动报错，不可编译）
        var age = 14
//         age = "He is 14 yeas old" 编译不过：这两种不可转
//         age = 14.3 编译不过：这两种不可转
        age = 20
        print(age)
        
        // 9、类型推断：这里直接指定类型，如果不指定，默认和8中一样，默认Int类型
        var newAge: Double = 20;    // 直接指定类型：也叫类型标注
        newAge = 20.000
        print(newAge)
        
        // 10、变量：命名规则和OC一致
        
        // 11、可选类型
        var optionalInt: Int?
        optionalInt = 50;
//        print(optionalInt)  // 输出：Optional(50)
        // 改进写法
        print(optionalInt ?? 0) // 指定一个默认值
        print(optionalInt!) // 输出：50
        // 11、2不能使用！符号读取nil的变量
//        var optionalFloat: Float?
//        print(optionalFloat!)   // 编译通过：crash
        
        // 11、3 强制解析：当你确定可选类型确实包含值之后，你可以在可选的名字后面加一个感叹号（!）来获取值
        var myStringStrong:String?
        myStringStrong = "Hello, Swift!"
//        if myStringStrong != nil {
//           print(myStringStrong!)
//        } else{
//           print("myStringStrong 值为 nil")
//        }
        // 改进写法
         print(myStringStrong ?? "字符串 nil")
        
        // 11、4 自动解析：可以在声明可选变量时使用感叹号（!）替换问号（?）。这样可选变量在使用时就不需要再加一个感叹号（!）来获取值
        var myAutoString:String!
        myAutoString = "Hello, Swift!"
//        if myAutoString != nil {
//           print(myAutoString)
//        } else{
//           print("myAutoString 值为 nil")
//        }
        // 改进写法
         print(myAutoString ?? "字符串 nil")
            
        // 11、5 可选绑定：使用可选绑定（optional binding）来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。可选绑定可以用在if和while语句中来对可选类型的值进行判断并把值赋给一个常量或者变量。
        var optionalString:String?
        optionalString = "Hello, Swift!"
        if let changeStr = optionalString {
           print("你的字符串值为 \(changeStr)")
        } else{
           print("你的字符串没有值")
        }
        
        // 12、字面量：其实就是类型的表达形式
//        let literalInt1 = 10 // 十进制的数值10
//        let literalInt2 = 0b11 // 二进制的数值3
//        let literalFloat1 = 10.111 // 十进制的浮点型是指10.111
//        let literalFloat2 = 0xC.3P0 // 十六进制浮点型字面量
//        let literalStr = "wct" // 字符串字面量 wct
        // 布尔类型的字面量默认类型是Bool，他有三个值：ture、false、nil（nil表示没有值）
        
        // 13、算数运算符
        // 这边介绍下区别的即可：赋值运算符：参考链接：https://www.runoob.com/swift/swift-operators.html
        
        // 13、1 位运算符、逻辑运算符、赋值运算符
        let A = 2
        var C = 3
        C <<= A // 按位左移后再赋值：C <<= 2 相当于 C = C << 2
        print("C 结果为：\(C)")
        C >>= A // 按位右移后再赋值：C >>= 2 相当于 C = C >> 2
        print("C 结果为：\(C)")
        C &= A // 按位与运算后赋值：C &= 2 相当于 C = C & 2
        print("C 结果为：\(C)")
        C ^= A // 按位异或运算符后再赋值：C ^= 2 相当于 C = C ^ 2
        print("C 结果为：\(C)")
        C |= A // 按位或运算后再赋值：C |= 2 相当于 C = C | 2
        print("C 结果为：\(C)")
    }
}

