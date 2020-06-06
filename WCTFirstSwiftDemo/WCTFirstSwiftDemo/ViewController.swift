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
        
        // 2020-06-04 learn
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
        /*
         int -> Int
         float -> Float
         double -> Double
         */
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
        
        
        // 2020-06-06 learn
        // 13、算数运算符
        // 这边介绍下区别的即可：赋值运算符：参考链接：https://www.runoob.com/swift/swift-operators.html
        // 13.1 位运算符
        let A = 2
        var C = 3
        // <<（二进制左移）、>>(二进制右移)，具体移动多少位，看A的数值，<<2 代表向左移动两位，反之同理
        C <<= A // 按位左移后再赋值：C <<= 2 相当于 C = C << 2
        print("C 结果为：\(C)")
        C = 3
        C >>= A // 按位右移后再赋值：C >>= 2 相当于 C = C >> 2
        print("C 结果为：\(C)")
        /*
         ~(取反)、& (与)、|（或）、^(异或)
         ~ 运算规则:  ~0=1,   ~1=0
         & 运算规则:  0&0=0,  0&1=0,  1&0=0,  1&1=1
         | 运算规则:  0|0=0,  0|1=1,  1|0=1,  1|1=1
         ^ 运算规则:  0^0=0,  0^1=1,  1^0=1,  1^1=0
         */
        C = 3
        C &= A // 按位 与 运算后赋值：C &= 2 相当于 C = C & 2
        print("C 结果为：\(C)")
        C = 3
        C ^= A // 按位 异或 运算符后再赋值：C ^= 2 相当于 C = C ^ 2
        print("C 结果为：\(C)")
        C = 3
        C |= A // 按位 与或 运算后再赋值：C |= 2 相当于 C = C | 2
        print("C 结果为：\(C)")
        
        // 13.2 区间运算符
        /*
         1...5(三点 闭区间：1、2、3、4、5)
         1..<5(二点+ 大于号 开区间：1、2、3、4)
         1>..5写法错误：没有小于号，小于号的话直接往后一位开始
         */
        print("闭区间运算符:")
        for index in 1...5 {
            print("\(index) * 5 = \(index * 5)")
        }

        print("半开区间运算符:")
        for index in 1..<5 {
            print("\(index) * 5 = \(index * 5)")
        }
        
        // 13.3 三元运算符没变
        // 13.4 运算优先级
        /*
         指针最优，单目运算优于双目运算。如正负号。
         先乘除（模），后加减。
         先算术运算，后移位运算，最后位运算。请特别注意：1 << 3 + 2 & 7 等价于 (1 << (3 + 2))&7
         逻辑运算最后计算
         */
        
        // 14、循环
        // 如果在一个case执行完后，继续执行下面的case，需要使用fallthrough(贯穿)关键字。
        let index = 10
        switch index {
           case 100  :
              print("index 的值为 100")
              fallthrough
           case 10,15  :
              print("index 的值为 10 或 15")
              fallthrough
           case 5  :
              print("index 的值为 5")
           default :
              print("默认 case")
        }
        
        // 15、字符串
        // 1、空字符串
        // isEmpty 可以判断 “” 和 只初始化 两个case，(初始化过不等于nil)
        // 【1】使用字符串字面量创建空字符串
        let stringA = ""
        if stringA.isEmpty {
           print("stringA 是空的")
        } else {
           print("stringA 不是空的")
        }
        // 【2】实例化 String 类来创建空字符串
        let stringB = String()
        if stringB.isEmpty {
           print("stringB 是空的")
        } else {
           print("stringB 不是空的")
        }
        // 【3】初始化过不等于nil
        let stringC = String()
        if stringC == nil {
           print("stringC 是空的")
        } else {
           print("stringC 不是空的")
        }
        // 2、字符串常量：可以使用 + 来拼接 字符串
        // 【1】stringA 可被修改
        var stringAA = "菜鸟教程："
        stringAA += "http://www.runoob.com"
        let stringAaA = stringAA + "    aaaa"
        print(stringAA)
        print(stringAaA)
        // 【2】stringB 不能修改
        let stringBB = String("菜鸟教程：")
//        stringBB += "http://www.runoob.com"   编译不过：常亮不可修改
        print(stringBB)
        // 3、字符串插入值：直接使用\() 替代%@，直接使用引号包括即可
        let varAAA   = 20
        let constAAAA = 100
        let varCCCC:Float = 20.0
        let stringAAAA = "\(varAAA) 乘于 \(constAAAA) 等于 \(varCCCC * 100)"
        print(stringAAAA)
        // 4、字符串长度
        /*
         字符串长度使用 String.count 属性来计算，实例如下：
         Swift 3 版本使用的是 String.characters.count
         */
        print("\(stringAAAA), 长度为 \(stringAAAA.count)")
        // 5、字符串比较： ==
        let varA = "Hello, Swift!"
        let varB = "Hello, World!"
        let varC = "Hello, World!"
        if varA == varB {
           print( "\(varA) 与 \(varB) 是相等的" )
        } else {
            print( "\(varA) 与 \(varB) 是不相等的" )
            if varC == varB {
                print( "\(varC) 与 \(varB) 是相等的" )
            }
        }
        // 6、Unicode字符串
        let unicodeString   = "菜鸟教程"
        print("UTF-8 编码: ")
        for code in unicodeString.utf8 {
           print("\(code)")
        }

        print("\n")

        print("UTF-16 编码: ")
        for code in unicodeString.utf16 {
           print("\(code)")
        }
        
        // 16、字符Character
        let char1: Character = "A"
        let char2: Character = "B"
        print("char1 的值为 \(char1)")
        print("char2 的值为 \(char2)")
        //【1】中以下赋值会报错
//        let char: Character = "AB"    // 编译不过: 字符只能存一个字符
//        print("Value of char \(char)")
        //【2】Swift 中不能创建空的 Character（字符） 类型变量或常量：
        // Swift 中以下赋值会报错
//        let char3: Character = ""     // 编译不过: 字符不能定义空字符常量 和 变量
//        var char4: Character = ""     // 编译不过: 字符不能定义空字符常量 和 变量
//        print("char3 的值为 \(char3)")
//        print("char4 的值为 \(char4)")
        // 【3】遍历字符串中的字符
        /*
         Swift 的 String 类型表示特定序列的 Character（字符） 类型值的集合。 每一个字符值代表一个 Unicode 字符。
         Swift 3 中的 String 需要通过 characters 去调用的属性方法，在 Swift 4 中可以通过 String 对象本身直接调用，例如：
         */
//        Swift 3 中：
//        for ch in "Runoob".characters {
//            print(ch)
//        }
        // Swift 4
        for ch in "Runoob" {
            print(ch)
        }
        // 【4】字符串连接字符
        var varaaaaa:String = "Hello "
        let varbbbbb:Character = "G"
        varaaaaa.append(varbbbbb)
//        varaaaaa += varbbbbb  // 编译不过：字符串连接字符:append() ,不能用 +
        print("varaaaaa  =  \(varaaaaa)")
    }
}

