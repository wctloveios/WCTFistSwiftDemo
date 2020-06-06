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
        
        /*
         全局提示：
        【1】如果一个变量（var），你没进行过任何变化操作，系统会提示你修改成常量（let）
         */
//        baseLearn()
//        arrayLearn()
//        dictLearn()
//        funcLearn()
//        blockLearn()
        typeLearn()
        
    }
    
    func typeLearn() {
        // 1、枚举
        
        /*
         枚举简单的说也是一种数据类型，只不过是这种数据类型只包含自定义的特定数据，它是一组有共同特性的数据的集合。
         Swift 的枚举类似于 Objective C 和 C 的结构，枚举的功能为:
         【1】它声明在类中，可以通过实例化类来访问它的值。
         【2】枚举也可以定义构造函数（initializers）来提供一个初始成员值；可以在原始的实现基础上扩展它们的功能。
         【3】可以遵守协议（protocols）来提供标准的功能。
         
         语法: Swift 中使用 enum 关键词来创建枚举并且把它们的整个定义放在一对大括号内：
         enum enumname {
            // 枚举定义放在这里
         }
         */
        
        // 定义枚举
        enum DaysofaWeek {
            case Sunday
            case Monday
            case TUESDAY
            case WEDNESDAY
            case THURSDAY
            case FRIDAY
            case Saturday
        }
        
        /* 案例PS
         【1】枚举中定义的值（如 Sunday，Monday，……和Saturday）是这个枚举的成员值（或成员）。case关键词表示一行新的成员值将被定义。
 
         【2】注意： 和 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。在上面的DaysofaWeek例子中，Sunday，Monday，……和Saturday不会隐式地赋值为0，1，……和6。相反，这些枚举成员本身就有完备的值，这些值是已经明确定义好的DaysofaWeek类型。
         */

        var weekDay = DaysofaWeek.THURSDAY
        // weekDay的类型可以在它被DaysofaWeek的一个可能值初始化时推断出来。一旦weekDay被声明为一个DaysofaWeek，你可以使用一个缩写语法（.）将其设置为另一个DaysofaWeek的值：
        weekDay = .FRIDAY
        switch weekDay
        {
        case .Sunday:
            print("星期天")
        case .Monday:
            print("星期一")
        case .TUESDAY:
            print("星期二")
        case .WEDNESDAY:
            print("星期三")
        case .THURSDAY:
            print("星期四")
        case .FRIDAY:
            print("星期五")
        case .Saturday:
            print("星期六")
        }
        

        // 1.1 相关值
        /*
            相关值                                                                                     原始值
            不同数据类型                                                                                相同数据类型
            实例: enum {10,0.8,"Hello"}                                                                实例: enum {10,35,50}
            值的创建基于常量或变量                                                                         预先填充的值
            相关值是当你在创建一个基于枚举成员的新常量或变量时才会被设置，并且每次当你这么做得时候，它的值可以是不同的。    原始值始终是相同的
         */
        
        // 1.1.1 相关值
        // 以下实例中我们定义一个名为 Student 的枚举类型，它可以是 Name 的一个字符串（String），或者是 Mark 的一个相关值（Int，Int，Int）。
        enum Student{
            case Name(String)
            case Mark(Int,Int,Int)
        }
        let studDetails = Student.Name("Runoob")
        let studMarks = Student.Mark(98,97,95)
        switch studMarks {
        case .Name(let studName):
            print("学生的名字是: \(studName)。")
        case .Mark(let Mark1, let Mark2, let Mark3):
            print("学生的成绩是: \(Mark1),\(Mark2),\(Mark3)。")
        }
        
        // 1.1.2 原始值
        /*
         原始值可以是字符串，字符，或者任何整型值或浮点型值。每个原始值在它的枚举声明中必须是唯一的。
         在原始值为整数的枚举时，不需要显式的为每一个成员赋值，Swift会自动为你赋值。
         例如，当使用整数作为原始值时，隐式赋值的值依次递增1。如果第一个值没有被赋初值，将会被自动置为0。

         */
        enum Month: Int {
            case January = 1, February, March, April, May, June, July, August, September, October, November, December
        }

        let yearMonth = Month.August.rawValue
        print("数字月份为: \(yearMonth)。")
    }
    
    func blockLearn() {
        // 1 闭包
        /*
         闭包(Closures)是自包含的功能代码块，可以在代码中使用或者用来作为参数传值。
         Swift 中的闭包与 C 和 Objective-C 中的代码块（blocks）以及其他一些编程语言中的 匿名函数比较相似。
         全局函数 和 嵌套函数 其实就是特殊的闭包。
         
         闭包的形式有：
         【1】全局函数：有名字但不能捕获任何值。
         【2】嵌套函数：有名字，也能捕获封闭函数内的值。
         【3】闭包表达式：有名字，也能捕获封闭函数内的值。
                 
         Swift中的闭包有很多优化的地方:
         【1】根据上下文推断参数和返回值类型
         【2】从单行表达式闭包中隐式返回（也就是闭包体只有一行代码，可以省略return）
         【3】可以使用简化参数名，如$0, $1(从0开始，表示第i个参数...)
         【4】提供了尾随闭包语法(Trailing closure syntax)
         */
        
        
        // 1.1 语法
        /*// 实例1
         以下定义了一个接收参数并返回指定类型的闭包语法：
         {(parameters) -> return type in
            statements
         }
         */
        let studname = {print("Swift 闭包实例。")}
        studname()
        
        /*// 实例2
         以下闭包形式接收两个参数并返回布尔值：
         {(Int, Int) -> Bool in
            Statement1
            Statement 2
             ---
            Statement n
         }
         */
        let divide = {(val1: Int, val2: Int) -> Int in
           return val1 / val2
        }
        let result = divide(200, 20)
        print(result)
        
        
        // 1.2 闭包表达式
        /*
         闭包表达式是一种利用简洁语法构建内联闭包的方式。 闭包表达式提供了一些语法优化，使得撰写闭包变得简单明了。
         */
        // sorted 方法
        /*
         Swift 标准库提供了名为 sorted(by:) 的方法，会根据您提供的用于排序的闭包函数将已知类型数组中的值进行排序。
         排序完成后，sorted(by:) 方法会返回一个与原数组大小相同，包含同类型元素且元素已正确排序的新数组。原数组不会被 sorted(by:) 方法修改。
         sorted(by:)方法需要传入两个参数：
         【1】已知类型的数组
         【2】闭包函数，该闭包函数需要传入与数组元素类型相同的两个值，并返回一个布尔类型值来表明当排序结束后传入的第一个参数排在第二个参数前面还是后面。如果第一个参数值出现在第二个参数值前面，排序闭包函数需要返回 true，反之返回 false。
         */
        print("sorted")
        let names = ["AT", "AE", "D", "S", "BE"]
        // 使用普通函数(或内嵌函数)提供排序功能,闭包函数类型需为(String, String) -> Bool。
        func backwards(s1: String, s2: String) -> Bool {
            return s1 > s2
        }
        let reversed = names.sorted(by: backwards)
        print(reversed)
        
        
        // 1.3 参数名称缩写
        /*
         Swift 自动为内联函数提供了参数名称缩写功能，您可以直接通过$0,$1,$2来顺序调用闭包的参数。
         
         如果你在闭包表达式中使用参数名称缩写, 您可以在闭包参数列表中省略对其定义, 并且对应参数名称缩写的类型会通过函数类型进行推断。in 关键字同样也可以被省略.
         */
        print("参数名称缩写")
        let names2 = ["AT", "AE", "D", "S", "BE"]
        let reversed2 = names2.sorted(by: {$0 > $1}) // {$0 > $1} 等同上面的函数，$0 和 $1表示闭包中第一个和第二个String类型的参数。
        print(reversed2)
        
        
        // 1.4 尾随闭包
        /*
         尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用。
         func someFunctionThatTakesAClosure(closure: () -> Void) {
             // 函数体部分
         }

         // 以下是不使用尾随闭包进行函数调用
         someFunctionThatTakesAClosure({
             // 闭包主体部分
         })

         // 以下是使用尾随闭包进行函数调用
         someFunctionThatTakesAClosure() {
           // 闭包主体部分
         }
         */
        print("尾随闭包")
        let names3 = ["AT", "AE", "D", "S", "BE"]
        //尾随闭包
        let reversed3 = names3.sorted(){$0 > $1}
        print(reversed3)
        // 如果函数只需要闭包表达式一个参数，当您使用尾随闭包时，您甚至可以把()省略掉。
        let names4 = ["AT", "AE", "D", "S", "BE"]
        let reversed4 = names4.sorted{$0 > $1}
        print(reversed4)
        
        
        // 1.5 捕获值
        /*
         闭包可以在其定义的上下文中捕获常量或变量。
         即使定义这些常量和变量的原域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
         Swift最简单的闭包形式是嵌套函数，也就是定义在其他函数的函数体内的函数。
         嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量。
         看这个例子：
         */
        func makeIncrementor(forIncrement amount: Int) -> () -> Int {
            var runningTotal = 0
            print(runningTotal)
            func incrementor() -> Int {
                runningTotal += amount
                print(runningTotal)
                return runningTotal
            }
            return incrementor
        }
        /*
         一个函数makeIncrementor ，它有一个Int型的参数amout, 并且它有一个外部参数名字forIncremet，意味着你调用的时候，必须使用这个外部名字。返回值是一个()-> Int的函数。
                
         函数体内，声明了变量 runningTotal 和一个函数 incrementor。
                incrementor函数并没有获取任何参数，但是在函数体内访问了runningTotal和amount变量。这是因为其通过捕获在包含它的函数体内已经存在的runningTotal和amount变量而实现。
                由于没有修改amount变量，incrementor实际上捕获并存储了该变量的一个副本，而该副本随着incrementor一同被存储。
                所以我们调用这个函数时会累加：
         */
        print("初始 求值")
        let incrementByTen = makeIncrementor(forIncrement: 10)
        // 返回的值为10
        print("10 求值")
        print(incrementByTen())
        // 返回的值为20
        print("20 求值")
        print(incrementByTen())
        // 返回的值为30
        print("30 求值")
        print(incrementByTen())
        
        
        // 1.6 闭包是引用类型
        /*
         上面的例子中，incrementByTen是常量，但是这些常量指向的闭包仍然可以增加其捕获的变量值。
         这是因为函数和闭包都是引用类型。
         无论您将函数/闭包赋值给一个常量还是变量，您实际上都是将常量/变量的值设置为对应函数/闭包的引用。 上面的例子中，incrementByTen指向闭包的引用是一个常量，而并非闭包内容本身。
         这也意味着如果您将闭包赋值给了两个不同的常量/变量，两个值都会指向同一个闭包：
         */
        let alsoIncrementByTen = incrementByTen
        // 返回的值也为40
        print(alsoIncrementByTen())

    }
    
    func funcLearn() -> () {
        // 1 函数
        /*
         Swift 函数用来完成特定任务的独立的代码块。
         Swift使用一个统一的语法来表示简单的C语言风格的函数到复杂的Objective-C语言风格的方法。
            函数声明: 告诉编译器函数的名字，返回类型及参数。
            函数定义: 提供了函数的实体。
         Swift 函数包含了参数类型及返回值类型：
         */
        
        // 1.1 定义
        /*
         Swift 定义函数使用关键字 func。
         定义函数的时候，可以指定一个或多个输入参数和一个返回值类型。
         每个函数都有一个函数名来描述它的功能。通过函数名以及对应类型的参数值来调用这个函数。函数的参数传递的顺序必须与参数列表相同。
         函数的实参传递的顺序必须与形参列表相同，-> 后定义函数的返回值类型。
         语法:
         func funcname(形参) -> returntype
         {
            code ...
            return parameters
         }
         */
        let name = wctFunc(name: "wct")
        print(name)
        
        
        // 1.2 放置这里：局部函数
        func wctFuncNew(name: String) -> String {
            return ("姓名New:\(name)")
        }
        print(wctFuncNew(name: "wct"))
        
        
        // 1.3 无返回值函数写法
        func tupleLearn() {
            // 1、元祖
            print("没有返回值函数")
        }
        
        
        // 1.4 局部参数名
        func sample(number: Int) {
            print(number)
        }
        
        
        // 1.5 外部参数名
        func pow(firstArg a: Int, secondArg b: Int) -> Int {
           var res = a
           for _ in 1..<b {
              res = res * a
           }
           return res
        }
        let number = pow(firstArg:5, secondArg:3)
        print(number)
        
        
        // 1.6 可变参数
        /*
         可变参数可以接受零个或多个值。函数调用时，你可以用可变参数来指定函数参数，其数量是不确定的。
         可变参数通过在变量类型名后面加入（...）的方式来定义。
         */
        func vari<N>(members: N...){
            for i in members {
                print(i)
            }
        }
        vari(members: 4,3,5)
        vari(members: 4.5, 3.1, 5.6)
        vari(members: "Google", "Baidu", "Runoob")
        
        
        // 1.7 常量，变量及 I/O 参数
        /*
         一般默认在函数中定义的参数都是常量参数，也就是这个参数你只可以查询使用，不能改变它的值。
         如果想要声明一个变量参数，可以在参数定义前加 inout 关键字，这样就可以改变这个参数的值了。
         例如：func  getName(_ name: inout String).........
         此时这个 name 值可以在函数中改变。
         一般默认的参数传递都是传值调用的，而不是传引用。所以传入的参数在函数内改变，并不影响原来的那个参数。传入的只是这个参数的副本。
         当传入的参数作为输入输出参数时，需要在参数名前加 & 符，表示这个值可以被函数修改。
         */
        func swapTwoInts(_ a: inout Int, _ b: inout Int) {
            a = a + b
            b = a - b
            a = a - b
        }
        var x = 1
        var y = 5
        // 需要注意的是，someInt 和 anotherInt 在传入 swapTwoInts(_:_:) 函数前，都加了 & 的前缀。
        swapTwoInts(&x, &y)
        print("x 现在的值 \(x), y 现在的值 \(y)")
        
        
        // 1.8 使用函数类型（将整个函数作为一个变量）
        // 在 Swift 中，使用函数类型就像使用其他类型一样。例如，你可以定义一个类型为函数的常量或变量，并将适当的函数赋值给它：
        func sum(a: Int, b: Int) -> Int {
           return a + b
        }
        let addition: (Int, Int) -> Int = sum
        print("输出结果: \(addition(40, 89))")
        
        
        // 1.9 函数类型作为参数类型、函数类型作为返回类型
        func another(addition: (Int, Int) -> Int, a: Int, b: Int) {
            print("输出结果: \(addition(a, b))")
        }
        another(addition: sum, a: 10, b: 20)
        
        
        // 1.10 函数嵌套 todo:为啥加forDecrement
        func calcDecrement(forDecrement total: Int) -> () -> Int {
           var overallDecrement = 0
           func decrementer() -> Int {
              overallDecrement -= total
              return overallDecrement
           }
           return decrementer
        }
        let decrem = calcDecrement(forDecrement: 30)
        print(decrem())
        // 解释：一个函数calcDecrement ，它有一个Int型的参数total, 并且它有一个外部参数名字forDecrement，意味着你调用的时候，必须使用这个外部名字。返回值是一个()-> Int的函数。
        
    }
    
    // 放置这里：全局函数
    func wctFunc(name: String) -> String {
        return ("姓名:\(name)")
    }
    
    func dictLearn() -> () {
        // 1、字典
        /*
         Swift 字典用来存储无序的相同类型数据的集合，Swift 字典会强制检测元素的类型，如果类型不同则会报错。
         Swift 字典每个值（value）都关联唯一的键（key），键作为字典中的这个值数据的标识符。
         Swift 字典的key没有类型限制可以是 整型 或 字符串，但必须是唯一的。
         
         和数组中的数据项不同，字典中的数据项并没有具体顺序。我们在需要通过标识符（键）访问数据的时候使用字典，这种方法很大程度上和我们在现实世界中使用字典查字义的方法一样。
         如果创建一个字典，并赋值给一个变量，则创建的字典就是可以修改的。这意味着在创建字典后，可以通过添加、删除、修改的方式改变字典里的项目。
         如果将一个字典赋值给常量，字典就不可修改，并且字典的大小和内容都不可以修改。
         */
        
        // 1.1 创建
        // 我们可以使用以下语法来创建一个特定类型的空字典：
        // var someDict =  [KeyType: ValueType]()
        // 以下是创建一个空字典，键的类型为 Int，值的类型为 String 的简单语法：
        let someEmptyDict = [Int: String]()
        print(someEmptyDict)    // 结果：[:]
        // 以下为创建一个字典的实例：
        var someDataDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
        print(someDataDict)     // 结果：[1: "One", 2: "Two", 3: "Three"]
        
        
        // 1.2 访问
        print("key = 1 的值为 \(someDataDict[1])")
        print("key = 2 的值为 \(someDataDict[2])")
        print("key = 3 的值为 \(someDataDict[3])")
        
        
        // 1.3 修改
        someDataDict.updateValue("One 新的值", forKey: 1)
        someDataDict[2] = "Two 新的值"
        print(someDataDict)
        
        
        // 1.4 移除key-value 对
        /*
         我们可以使用 removeValueForKey() 方法来移除字典 key-value 对。如果 key 存在该方法返回移除的值，如果不存在返回 nil 。实例如下：
         */
        let removedValue = someDataDict.removeValue(forKey: 2)
        print(removedValue)
        print( "key = 1 的值为 \(someDataDict[1])" )
        print( "key = 2 的值为 \(someDataDict[2])" )
        print( "key = 3 的值为 \(someDataDict[3])" )
        
        
        // 1.5 遍历
        print("遍历字典：遍历值")
        for (key, value) in someDataDict {
           print("字典 key \(key) -  字典 value \(value)")
        }
        print("遍历字典：遍历value + key + 下标")
        for (index, value) in someDataDict.enumerated() {
            print("字典 key \(index) -  字典 (key, value) 对 \(value)")
        }
        
        
        // 1.6 字典转数组：无序
        let dictKeys = [Int](someDataDict.keys)
        let dictValues = [String](someDataDict.values)
        print(dictKeys)
        print(dictValues)
        
        
        // 1.7 count & isEmpty
        /*
         我们可以使用只读的 count 属性来计算字典有多少个键值对：
         我们可以通过只读属性 isEmpty 来判断字典是否为空，返回布尔值
         */
        print("someDataDict 含有 \(someDataDict.count) 个键值对")
        let someDict3:[Int:String] = [Int:String]()
        print("someDataDict = \(someDataDict.isEmpty)")
        print("someDict3 = \(someDict3.isEmpty)")
    }
    
    func arrayLearn() -> () {
        print("集合学习")
        
        // 1、数组
        /*
         Swift 数组使用有序列表存储同一类型的多个值。相同的值可以多次出现在一个数组的不同位置中。
         Swift 数组会强制检测元素的类型，如果类型不同则会报错，
         Swift 数组应该遵循像Array<Element>这样的形式，其中Element是这个数组中唯一允许存在的数据类型。
         
         如果创建一个数组，并赋值给一个变量，则创建的集合就是可以修改的。这意味着在创建数组后，可以通过添加、删除、修改的方式改变数组里的项目。
         如果将一个数组赋值给常量，数组就不可更改，并且数组的大小和内容都不可以修改。
         */
        //【1】以下实例创建了一个类型为 Int ，数量为 3，初始值为 0 的空数组：
        let someEmptyInts = [Int](repeating: 0, count: 3)
        print(someEmptyInts)
        // 以下实例创建了含有三个元素的数组：
        var someDataInts:[Int] = [10, 20, 30]
        print(someDataInts)
        
        
        // 1.1 访问数组（下标法）
        print(someDataInts[2])
        
        
        // 1.2 修改数组
        //【1】增加数据
        someDataInts.append(40)
        someDataInts += [50]
        print(someDataInts)
        //【2】移除数据
        someDataInts.remove(at: 1)
        print(someDataInts)
        
        
        // 1.3 遍历数组
        // 【1】只输出值
        for item in someDataInts {
           print(item)
        }
        // 【2】输出值和下标：
        /*
         如果我们同时需要每个数据项的值和索引值，可以使用 String 的 enumerate() 方法来进行数组遍历
         */
        for (index, item) in someDataInts.enumerated() {
            print("在 index = \(index) 位置上的值为 \(item)")
        }
        
        
        // 1.4 合并数组:直接使用 + 即可
        let intsA = [Int](repeating: 2, count:2)
        let intsB = [Int](repeating: 1, count:3)
        let intsC = intsA + intsB
        for item in intsC {
            print(item)
        }
        
        
        // 1.5 count & isEmpty
        print("intsA 元素个数为 \(intsA.count)")
        let intsD = [Int]()
        print("intsA.isEmpty = \(intsA.isEmpty)")
        print("intsD.isEmpty = \(intsD.isEmpty)")
    }
    
    func baseLearn() -> () {
        print("基础知识学习")
    
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

