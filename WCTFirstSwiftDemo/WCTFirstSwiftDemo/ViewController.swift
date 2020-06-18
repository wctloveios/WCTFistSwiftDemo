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
//        typeLearn()
//        structLearn()
//        classLearn()
//        propertyLearn()
//        funcTwoLearn()
//        indexScriptLearn()
//        successionLearn()
//        initLearn()
//        dellocLearn()
//        optionalChainingLearn()
//        arcLearn()
//        typeExchange()
//        extensionLearn()
//        protocolLearn()
//        genericLearn()
//        rightLearn()
        let time: TimeInterval = 0.5
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
//           self.present(LearnBaseUIViewController.init(), animated: true) {
//
//           }
            
            self.present(LearnSeniorUIViewController.init(), animated: true) {

            }
        }
    }
    
    func rightLearn() {
        // Swift 访问控制
        /*
         访问控制可以限定其他源文件或模块中代码对你代码的访问级别。
         你可以明确地给单个类型（类、结构体、枚举）设置访问级别，也可以给这些类型的属性、函数、初始化方法、基本类型、下标索引等设置访问级别。
         协议也可以被限定在一定的范围内使用，包括协议里的全局常量、变量和函数。
         访问控制基于模块与源文件。
         模块指的是以独立单元构建和发布的 Framework 或 Application。在 Swift 中的一个模块可以使用 import 关键字引入另外一个模块。
         源文件是单个源码文件，它通常属于一个模块， 源文件可以包含多个类和函数 的定义。
         
         Swift 为代码中的实体提供了四种不同的访问级别:public、internal、fileprivate、private。
         【1】public    可以访问自己模块中源文件里的任何实体，别人也可以通过引入该模块来访问源文件里的所有实体。
         【2】internal    可以访问自己模块中源文件里的任何实体，但是别人不能访问该模块中源文件里的实体。
         【3】fileprivate    文件内私有，只能在当前源文件中使用。
         【4】private    只能在类中访问，离开了这个类或者结构体的作用域外面就无法访问。
            public 为最高级访问级别，private 为最低级访问级别。
         
         语法：
         通过修饰符public、internal、fileprivate、private来声明实体的访问级别：
         public class SomePublicClass {}
         internal class SomeInternalClass {}
         fileprivate class SomeFilePrivateClass {}
         private class SomePrivateClass {}
         
         public var somePublicVariable = 0
         internal let someInternalConstant = 0
         fileprivate func someFilePrivateFunction() {}
         private func somePrivateFunction() {}
         */
        // 除非有特殊的说明，否则实体都使用默认的访问级别 internal。
//        未指定访问级别默认为 internal
//        class SomeInternalClass {}              // 访问级别为 internal
//        let someInternalConstant = 0            // 访问级别为 internal
        
        
        // 1、函数类型访问权限
        /*
        函数的访问级别需要根据该函数的参数类型和返回类型的访问级别得出。
        下面的例子定义了一个名为someFunction全局函数，并且没有明确地申明其访问级别。
        */
//        func someFunction() -> (SomeInternalClass, SomePrivateClass) {
//            // 函数实现
//        }
        /*
        函数中其中一个类 SomeInternalClass 的访问级别是 internal，另一个 SomePrivateClass 的访问级别是 private。所以根据元组访问级别的原则，该元组的访问级别是 private（元组的访问级别与元组中访问级别最低的类型一致）。
        因为该函数返回类型的访问级别是 private，所以你必须使用 private 修饰符，明确的声明该函数：
        */
//        private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
//            // 函数实现
//        }
        // 将该函数申明为 public 或 internal，或者使用默认的访问级别 internal 都是错误的，因为如果这样你就无法访问 private 级别的返回值。
        
        
        
        // 2、枚举类型访问权限
        // 枚举中成员的访问级别继承自该枚举，你不能为枚举中的成员单独申明不同的访问级别。
        // 比如下面的例子，枚举 Student 被明确的申明为 public 级别，那么它的成员 Name，Mark 的访问级别同样也是 public：
//        public enum Student {
//            case Name(String)
//            case Mark(Int,Int,Int)
//        }
//
//        var studDetails = Student.Name("Swift")
//        var studMarks = Student.Mark(98,97,95)
//
//        switch studMarks {
//        case .Name(let studName):
//            print("学生名: \(studName).")
//        case .Mark(let Mark1, let Mark2, let Mark3):
//            print("学生成绩: \(Mark1),\(Mark2),\(Mark3)")
//        }
//        以上程序执行输出结果为：
//        学生成绩: 98,97,95
        
        
        // 3、子类访问权限
        // 子类的访问级别不得高于父类的访问级别。比如说，父类的访问级别是internal，子类的访问级别就不能申明为public。
//        public class SuperClass {
//            fileprivate func show() {
//                print("超类")
//            }
//        }
//
//        // 访问级别不能高于超类 internal > public
//        internal class SubClass: SuperClass  {
//            override internal func show() {
//                print("子类")
//            }
//        }
//
//        let sup = SuperClass()
//        sup.show()
//
//        let sub = SubClass()
//        sub.show()
//        以上程序执行输出结果为：
//        超类
//        子类
        
        
        
        // 4、常量、变量、属性、下标访问权限
        /*
         常量、变量、属性不能拥有比它们的类型更高的访问级别。
         比如说，你定义一个public级别的属性，但是它的类型是private级别的，这是编译器所不允许的。
         同样，下标也不能拥有比索引类型或返回类型更高的访问级别。
         如果常量、变量、属性、下标索引的定义类型是private级别的，那么它们必须要明确的申明访问级别为private:
         private var privateInstance = SomePrivateClass()
         */
        
        
        
        // 5、Getter 和 Setter访问权限
        // 常量、变量、属性、下标索引的Getters和Setters的访问级别继承自它们所属成员的访问级别。
        // Setter的访问级别可以低于对应的Getter的访问级别，这样就可以控制变量、属性或下标索引的读写权限。
//        class Samplepgm {
//            fileprivate var counter: Int = 0{
//                willSet(newTotal){
//                    print("计数器: \(newTotal)")
//                }
//                didSet{
//                    if counter > oldValue {
//                        print("新增加数量 \(counter - oldValue)")
//                    }
//                }
//            }
//        }
//
//        let NewCounter = Samplepgm()
//        NewCounter.counter = 100
//        NewCounter.counter = 800
//        counter 的访问级别为 fileprivate，在文件内可以访问。
//        以上程序执行输出结果为：
//        计数器: 100
//        新增加数量 100
//        计数器: 800
//        新增加数量 700
        
        
        
        // 6、构造器和默认构造器访问权限
        /*
         【1】初始化
         我们可以给自定义的初始化方法申明访问级别，但是要不高于它所属类的访问级别。但必要构造器例外，它的访问级别必须和所属类的访问级别相同。
         如同函数或方法参数，初始化方法参数的访问级别也不能低于初始化方法的访问级别。
         
         【2】默认初始化方法
         Swift为结构体、类都提供了一个默认的无参初始化方法，用于给它们的所有属性提供赋值操作，但不会给出具体值。
         默认初始化方法的访问级别与所属类型的访问级别相同。
         
         实例:
         在每个子类的 init() 方法前使用 required 关键字声明访问权限。
         */
//        class classA {
//            required init() {
//                var a = 10
//                print(a)
//            }
//        }
//
//        class classB: classA {
//            required init() {
//                var b = 30
//                print(b)
//            }
//        }
//
//        let res = classA()
//        let show = classB()
//        以上程序执行输出结果为：
//        10
//        30
//        10
        
        
        // 7、协议访问权限
        /*
         如果想为一个协议明确的申明访问级别，那么需要注意一点，就是你要确保该协议只在你申明的访问级别作用域中使用。
         如果你定义了一个public访问级别的协议，那么实现该协议提供的必要函数也会是public的访问级别。这一点不同于其他类型，比如，public访问级别的其他类型，他们成员的访问级别为internal。
         */
//        public protocol TcpProtocol {
//            init(no1: Int)
//        }
//
//        public class MainClass {
//            var no1: Int // local storage
//            init(no1: Int) {
//                self.no1 = no1 // initialization
//            }
//        }
//
//        class SubClass: MainClass, TcpProtocol {
//            var no2: Int
//            init(no1: Int, no2 : Int) {
//                self.no2 = no2
//                super.init(no1:no1)
//            }
//
//            // Requires only one parameter for convenient method
//            required override convenience init(no1: Int)  {
//                self.init(no1:no1, no2:0)
//            }
//        }
//
//        let res = MainClass(no1: 20)
//        let show = SubClass(no1: 30, no2: 50)
//
//        print("res is: \(res.no1)")
//        print("res is: \(show.no1)")
//        print("res is: \(show.no2)")
//        以上程序执行输出结果为：
//        res is: 20
//        res is: 30
//        res is: 50
        
        
        //8、 扩展访问权限
        /*
         可以在条件允许的情况下对类、结构体、枚举进行扩展。扩展成员应该具有和原始类成员一致的访问级别。比如你扩展了一个公共类型，那么你新加的成员应该具有和原始成员一样的默认的internal访问级别。
         或者，你可以明确申明扩展的访问级别（比如使用private extension）给该扩展内所有成员申明一个新的默认访问级别。这个新的默认访问级别仍然可以被单独成员所申明的访问级别所覆盖。
         */
        
        
        // 9、泛型访问权限
        // 泛型类型或泛型函数的访问级别取泛型类型、函数本身、泛型类型参数三者中的最低访问级别。
//        public struct TOS<T> {
//            var items = [T]()
//            private mutating func push(item: T) {
//                items.append(item)
//            }
//
//            mutating func pop() -> T {
//                return items.removeLast()
//            }
//        }
//
//        var tos = TOS<String>()
//        tos.push("Swift")
//        print(tos.items)
//
//        tos.push("泛型")
//        print(tos.items)
//
//        tos.push("类型参数")
//        print(tos.items)
//
//        tos.push("类型参数名")
//        print(tos.items)
//        let deletetos = tos.pop()
//        以上程序执行输出结果为：
//        ["Swift"]
//        ["Swift", "泛型"]
//        ["Swift", "泛型", "类型参数"]
//        ["Swift", "泛型", "类型参数", "类型参数名"]
        
        
        // 10、类型别名
        /*
         任何你定义的类型别名都会被当作不同的类型，以便于进行访问控制。一个类型别名的访问级别不可高于原类型的访问级别。
         比如说，一个private级别的类型别名可以设定给一个public、internal、private的类型，但是一个public级别的类型别名只能设定给一个public级别的类型，不能设定给internal或private 级别的类型。
         注意：这条规则也适用于为满足协议一致性而给相关类型命名别名的情况。
         */
//        public protocol Container {
//            typealias ItemType
//            mutating func append(item: ItemType)
//            var count: Int { get }
//            subscript(i: Int) -> ItemType { get }
//        }
//
//        struct Stack<T>: Container {
//            // original Stack<T> implementation
//            var items = [T]()
//            mutating func push(item: T) {
//                items.append(item)
//            }
//
//            mutating func pop() -> T {
//                return items.removeLast()
//            }
//
//            // conformance to the Container protocol
//            mutating func append(item: T) {
//                self.push(item)
//            }
//
//            var count: Int {
//                return items.count
//            }
//
//            subscript(i: Int) -> T {
//                return items[i]
//            }
//        }
//
//        func allItemsMatch<
//            C1: Container, C2: Container
//            where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>
//            (someContainer: C1, anotherContainer: C2) -> Bool {
//                // check that both containers contain the same number of items
//                if someContainer.count != anotherContainer.count {
//                    return false
//                }
//
//                // check each pair of items to see if they are equivalent
//                for i in 0..<someContainer.count {
//                    if someContainer[i] != anotherContainer[i] {
//                        return false
//                    }
//                }
//
//                // all items match, so return true
//                return true
//        }
//
//        var tos = Stack<String>()
//        tos.push("Swift")
//        print(tos.items)
//
//        tos.push("泛型")
//        print(tos.items)
//
//        tos.push("Where 语句")
//        print(tos.items)
//
//        var eos = ["Swift", "泛型", "Where 语句"]
//        print(eos)
//        以上程序执行输出结果为：
//        ["Swift"]
//        ["Swift", "泛型"]
//        ["Swift", "泛型", "Where 语句"]
//        ["Swift", "泛型", "Where 语句"]
        
    }
    
    func genericLearn() {
        // 泛型
        /*
         Swift 泛型
         Swift 提供了泛型让你写出灵活且可重用的函数和类型。
         Swift 标准库是通过泛型代码构建出来的。
         Swift 的数组和字典类型都是泛型集。
         */
        
        // 1、你可以创建一个Int数组，也可创建一个String数组，或者甚至于可以是任何其他 Swift 的类型数据数组。
        // 以下实例是一个非泛型函数 exchange 用来交换两个 Int 值：
        // 定义一个交换两个变量的函数
//        func swapTwoInts(_ a: inout Int, _ b: inout Int) {
//            let temporaryA = a
//            a = b
//            b = temporaryA
//        }
//
//        var numb1 = 100
//        var numb2 = 200
//        print("交换前数据: \(numb1) 和 \(numb2)")
//        swapTwoInts(&numb1, &numb2)
//        print("交换后数据: \(numb1) 和 \(numb2)")
//        以上程序执行输出结果为：
//        交换前数据: 100 和 200
//        交换后数据: 200 和 100
        // 以上实例只试用与交换整数 Int 类型的变量。如果你想要交换两个 String 值或者 Double 值，就得重新写个对应的函数，例如 swapTwoStrings(_:_:) 和 swapTwoDoubles(_:_:)，如下所示：
        func swapTwoStrings(_ a: inout String, _ b: inout String) {
            let temporaryA = a
            a = b
            b = temporaryA
        }
         
        func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
            let temporaryA = a
            a = b
            b = temporaryA
        }
        /*
         从以上代码来看，它们功能代码是相同的，只是类型上不一样，这时我们可以使用泛型，从而避免重复编写代码。
        
         泛型使用了占位类型名（在这里用字母 T 来表示）来代替实际类型名（例如 Int、String 或 Double）。
         func swapTwoValues<T>(_ a: inout T, _ b: inout T)
        
         swapTwoValues 后面跟着占位类型名（T），并用尖括号括起来（<T>）。这个尖括号告诉 Swift 那个 T 是 swapTwoValues(_:_:) 函数定义内的一个占位类型名，因此 Swift 不会去查找名为 T 的实际类型。
         以下实例是一个泛型函数 exchange 用来交换两个 Int 和 String 值：
         */
        // 定义一个交换两个变量的函数
        func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
            let temporaryA = a
            a = b
            b = temporaryA
        }
         
        var numb1 = 100
        var numb2 = 200
         
        print("交换前数据:  \(numb1) 和 \(numb2)")
        swapTwoValues(&numb1, &numb2)
        print("交换后数据: \(numb1) 和 \(numb2)")
         
        var str1 = "A"
        var str2 = "B"
         
        print("交换前数据:  \(str1) 和 \(str2)")
        swapTwoValues(&str1, &str2)
        print("交换后数据: \(str1) 和 \(str2)")
        
        
        // 2、泛型类型
        /*
         Swift 允许你定义你自己的泛型类型。
         自定义类、结构体和枚举作用于任何类型，如同 Array 和 Dictionary 的用法。
         */
        
        // 后入先出
        // Int 型的栈
        struct IntStack {
            var items = [Int]()
            mutating func push(_ item: Int) {
                items.append(item)
            }
            mutating func pop() -> Int {
                return items.removeLast()
            }
        }
        /*
         这个结构体在栈中使用一个名为 items 的 Array 属性来存储值。Stack 提供了两个方法：push(_:) 和 pop()，用来向栈中压入值以及从栈中移除值。这些方法被标记为 mutating，因为它们需要修改结构体的 items 数组。
         上面的 IntStack 结构体只能用于 Int 类型。不过，可以定义一个泛型 Stack 结构体，从而能够处理任意类型的值。
         下面是相同代码的泛型版本：
         */
        // 泛型的栈
        struct Stack<Element> {
            var items = [Element]()
            mutating func push(_ item: Element) {
                items.append(item)
            }
            mutating func pop() -> Element {
                return items.removeLast()
            }
        }
         
        var stackOfStrings = Stack<String>()
        print("字符串元素入栈: ")
        stackOfStrings.push("google")
        stackOfStrings.push("runoob")
        print(stackOfStrings.items);
         
        let deletetos = stackOfStrings.pop()
        print("出栈元素: " + deletetos)
         
        var stackOfInts = Stack<Int>()
        print("整数元素入栈: ")
        stackOfInts.push(1)
        stackOfInts.push(2)
        print(stackOfInts.items);
//        程序实例执行结果为：
//        字符串元素入栈:
//        ["google", "runoob"]
//        出栈元素: runoob
//        整数元素入栈:
//        [1, 2]
        /*
         Stack 基本上和 IntStack 相同，占位类型参数 Element 代替了实际的 Int 类型。
         以上实例中 Element 在如下三个地方被用作占位符：
         创建 items 属性，使用 Element 类型的空数组对其进行初始化。
         指定 push(_:) 方法的唯一参数 item 的类型必须是 Element 类型。
         指定 pop() 方法的返回值类型必须是 Element 类型。
         */
        
        
        // 3、扩展泛型类型
        /*
         当你扩展一个泛型类型的时候（使用 extension 关键字），你并不需要在扩展的定义中提供类型参数列表。更加方便的是，原始类型定义中声明的类型参数列表在扩展里是可以使用的，并且这些来自原始类型中的参数名称会被用作原始定义中类型参数的引用。
         下面的例子扩展了泛型类型 Stack，为其添加了一个名为 topItem 的只读计算型属性，它将会返回当前栈顶端的元素而不会将其从栈中移除：
         */
//        extension Stack {
//            var topItem: Element? {
//               return items.isEmpty ? nil : items[items.count - 1]
//            }
//        }
//
//        var stackOfStrings2 = Stack<String>()
//        print("字符串元素入栈: ")
//        stackOfStrings2.push("google")
//        stackOfStrings2.push("runoob")
//
//        if let topItem = stackOfStrings2.topItem {
//            print("栈中的顶部元素是：\(topItem).")
//        }
//
//        print(stackOfStrings2.items)
//        以上程序执行输出结果为：
//        字符串元素入栈:
//        栈中的顶部元素是：runoob.
//        ["google", "runoob"]
        /*
         实例中 topItem 属性会返回一个 Element 类型的可选值。当栈为空的时候，topItem 会返回 nil；当栈不为空的时候，topItem 会返回 items 数组中的最后一个元素。
         
         我们也可以通过扩展一个存在的类型来指定关联类型。
         例如 Swift 的 Array 类型已经提供 append(_:) 方法，一个 count 属性，以及一个接受 Int 类型索引值的下标用以检索其元素。这三个功能都符合 Container 协议的要求，所以你只需简单地声明 Array 采纳该协议就可以扩展 Array。
         以下实例创建一个空扩展即可:
         extension Array: Container {}
         */

        
        // 4、类型约束：型约束指定了一个必须继承自指定类的类型参数，或者遵循一个特定的协议或协议构成。
        /*
         类型约束语法：
         你可以写一个在一个类型参数名后面的类型约束，通过冒号分割，来作为类型参数链的一部分。这种作用于泛型函数的类型约束的基础语法如下所示（和泛型类型的语法相同）：
//         func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
//             // 这里是泛型函数的函数体部分
//         }
//         上面这个函数有两个类型参数。第一个类型参数 T，有一个要求 T 必须是 SomeClass 子类的类型约束；第二个类型参数 U，有一个要求 U 必须符合 SomeProtocol 协议的类型约束。
//         */
//        // 实例
////        // 非泛型函数，查找指定字符串在数组中的索引
////        func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
////            for (index, value) in array.enumerated() {
////                if value == valueToFind {
////                    // 找到返回索引值
////                    return index
////                }
////            }
////            return nil
////        }
////
////
////        let strings = ["google", "weibo", "taobao", "runoob", "facebook"]
////        if let foundIndex = findIndex(ofString: "runoob", in: strings) {
////            print("runoob 的索引为 \(foundIndex)")
////        }
////        索引下标从 0 开始。
////        以上程序执行输出结果为：
////        runoob 的索引为 3
//
//
//        // 5、关联类
//        /*
//         Swift 中使用 associatedtype 关键字来设置关联类型实例。
//         下面例子定义了一个 Container 协议，该协议定义了一个关联类型 ItemType。
//         Container 协议只指定了三个任何遵从 Container 协议的类型必须提供的功能。遵从协议的类型在满足这三个条件的情况下也可以提供其他额外的功能。
//         */
//        // Container 协议
//        protocol Container {
//            associatedtype ItemType
//            // 添加一个新元素到容器里
//            mutating func append(_ item: ItemType)
//            // 获取容器中元素的数
//            var count: Int { get }
//            // 通过索引值类型为 Int 的下标检索到容器中的每一个元素
//            subscript(i: Int) -> ItemType { get }
//        }
//
//        // Stack 结构体遵从 Container 协议
//        struct Stack<Element>: Container {
//            // Stack<Element> 的原始实现部分
//            var items = [Element]()
//            mutating func push(_ item: Element) {
//                items.append(item)
//            }
//            mutating func pop() -> Element {
//                return items.removeLast()
//            }
//            // Container 协议的实现部分
//            mutating func append(_ item: Element) {
//                self.push(item)
//            }
//            var count: Int {
//                return items.count
//            }
//            subscript(i: Int) -> Element {
//                return items[i]
//            }
//        }
//
//        var tos = Stack<String>()
//        tos.push("google")
//        tos.push("runoob")
//        tos.push("taobao")
//        // 元素列表
//        print(tos.items)
//        // 元素个数
//        print( tos.count)
//        以上程序执行输出结果为：
//        ["google", "runoob", "taobao"]
//        3
        
        // 6、Where 语句
        /*
         类型约束能够确保类型符合泛型函数或类的定义约束。
         你可以在参数列表中通过where语句定义参数的约束。
         你可以写一个where语句，紧跟在在类型参数列表后面，where语句后跟一个或者多个针对关联类型的约束，以及（或）一个或多个类型和关联类型间的等价(equality)关系。
         
         实例:
         下面的例子定义了一个名为allItemsMatch的泛型函数，用来检查两个Container实例是否包含相同顺序的相同元素。
         如果所有的元素能够匹配，那么返回 true，反之则返回 false。
         */
//        // Container 协议
//        protocol Container {
//            associatedtype ItemType
//            // 添加一个新元素到容器里
//            mutating func append(_ item: ItemType)
//            // 获取容器中元素的数
//            var count: Int { get }
//            // 通过索引值类型为 Int 的下标检索到容器中的每一个元素
//            subscript(i: Int) -> ItemType { get }
//        }
//         
//        // // 遵循Container协议的泛型TOS类型
//        struct Stack<Element>: Container {
//            // Stack<Element> 的原始实现部分
//            var items = [Element]()
//            mutating func push(_ item: Element) {
//                items.append(item)
//            }
//            mutating func pop() -> Element {
//                return items.removeLast()
//            }
//            // Container 协议的实现部分
//            mutating func append(_ item: Element) {
//                self.push(item)
//            }
//            var count: Int {
//                return items.count
//            }
//            subscript(i: Int) -> Element {
//                return items[i]
//            }
//        }
//        // 扩展，将 Array 当作 Container 来使用
//        extension Array: Container {}
//         
//        func allItemsMatch<C1: Container, C2: Container>
//            (_ someContainer: C1, _ anotherContainer: C2) -> Bool
//            where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
//                
//                // 检查两个容器含有相同数量的元素
//                if someContainer.count != anotherContainer.count {
//                    return false
//                }
//                
//                // 检查每一对元素是否相等
//                for i in 0..<someContainer.count {
//                    if someContainer[i] != anotherContainer[i] {
//                        return false
//                    }
//                }
//                
//                // 所有元素都匹配，返回 true
//                return true
//        }
//        var tos = Stack<String>()
//        tos.push("google")
//        tos.push("runoob")
//        tos.push("taobao")
//         
//        var aos = ["google", "runoob", "taobao"]
//         
//        if allItemsMatch(tos, aos) {
//            print("匹配所有元素")
//        } else {
//            print("元素不匹配")
//        }
//        以上程序执行输出结果为：
//        匹配所有元素
    }
    
    func protocolLearn() {
        // 协议
        /*
         协议规定了用来实现某一特定功能所必需的方法和属性。
         任意能够满足协议要求的类型被称为遵循(conform)这个协议。
         类，结构体或枚举类型都可以遵循协议，并提供具体实现来完成协议定义的方法和功能。
         
         1、语法
         协议的语法格式如下：
         protocol SomeProtocol {
             // 协议内容
         }
        
         要使类遵循某个协议，需要在类型名称后加上协议名称，中间以冒号:分隔，作为类型定义的一部分。遵循多个协议时，各协议之间用逗号,分隔。
         struct SomeStructure: FirstProtocol, AnotherProtocol {
             // 结构体内容
         }
         
         如果类在遵循协议的同时拥有父类，应该将父类名放在协议名之前，以逗号分隔。
         class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
             // 类的内容
         }
         */
        
        // 2、对属性的规定
        /*
         协议用于指定特定的实例属性或类属性，而不用指定是存储型属性或计算型属性。此外还必须指明是只读的还是可读可写的。
         协议中的通常用var来声明变量属性，在类型声明后加上{ set get }来表示属性是可读可写的，只读属性则用{ get }来表示。
         */
//        print("对属性的规定")
//        protocol classa {
//            var marks: Int { get set }
//            var result: Bool { get }
//            func attendance() -> String
//            func markssecured() -> String
//        }
//
//        protocol classb: classa {
//            var present: Bool { get set }
//            var subject: String { get set }
//            var stname: String { get set }
//
//        }
//
//        class classc: classb {
//            var marks = 96
//            let result = true
//            var present = false
//            var subject = "Swift 协议"
//            var stname = "Protocols"
//
//            func attendance() -> String {
//                return "The \(stname) has secured 99% attendance"
//            }
//
//            func markssecured() -> String {
//                return "\(stname) has scored \(marks)"
//            }
//        }
//
//        let studdet = classc()
//        studdet.stname = "Swift"
//        studdet.marks = 98
//        studdet.markssecured()
//
//        print(studdet.marks)
//        print(studdet.result)
//        print(studdet.present)
//        print(studdet.subject)
//        print(studdet.stname)
        
        // 3、对 Mutating 方法的规定
        /*
         有时需要在方法中改变它的实例。
         例如，值类型(结构体，枚举)的实例方法中，将mutating关键字作为函数的前缀，写在func之前，表示可以在该方法中修改它所属的实例及其实例属性的值。
         */
//        print("3、对 Mutating 方法的规定")
//        protocol daysofaweek {
//            mutating func show()
//        }
//
//        enum days: daysofaweek {
//            case sun, mon, tue, wed, thurs, fri, sat
//            mutating func show() {
//                switch self {
//                case .sun:
//                    self = .sun
//                    print("Sunday")
//                case .mon:
//                    self = .mon
//                    print("Monday")
//                case .tue:
//                    self = .tue
//                    print("Tuesday")
//                case .wed:
//                    self = .wed
//                    print("Wednesday")
//                case .thurs:
//                    self = .thurs
//                    print("Wednesday")
//                case .fri:
//                    self = .fri
//                    print("Wednesday")
//                case .sat:
//                    self = .sat
//                    print("Saturday")
//                default:
//                    print("NO Such Day")
//                }
//            }
//        }
//
//        var res = days.wed
//        res.show()
//
//        以上程序执行输出结果为：
//        Wednesday
        
        // 4、对构造器的规定
        /*
         协议可以要求它的遵循者实现指定的构造器。
         你可以像书写普通的构造器那样，在协议的定义里写下构造器的声明，但不需要写花括号和构造器的实体，语法如下：
         
         protocol SomeProtocol {
            init(someParameter: Int)
         }
         
         实例:
         protocol tcpprotocol {
            init(aprot: Int)
         }
         */
        
        // 5、协议构造器规定在类中的实现
        // 你可以在遵循该协议的类中实现构造器，并指定其为类的指定构造器或者便利构造器。在这两种情况下，你都必须给构造器实现标上"required"修饰符：
//        class SomeClass: SomeProtocol {
//           required init(someParameter: Int) {
//              // 构造器实现
//           }
//        }
//
//        protocol tcpprotocol {
//           init(aprot: Int)
//        }
//
//        class tcpClass: tcpprotocol {
//           required init(aprot: Int) {
//           }
//        }
        // 使用required修饰符可以保证：所有的遵循该协议的子类，同样能为构造器规定提供一个显式的实现或继承实现。
        // 如果一个子类重写了父类的指定构造器，并且该构造器遵循了某个协议的规定，那么该构造器的实现需要被同时标示required和override修饰符：
//        protocol tcpprotocol {
//            init(no1: Int)
//        }
//
//        class mainClass {
//            var no1: Int // 局部变量
//            init(no1: Int) {
//                self.no1 = no1 // 初始化
//            }
//        }
//
//        class subClass: mainClass, tcpprotocol {
//            var no2: Int
//            init(no1: Int, no2 : Int) {
//                self.no2 = no2
//                super.init(no1:no1)
//            }
//            // 因为遵循协议，需要加上"required"; 因为继承自父类，需要加上"override"
//            required override convenience init(no1: Int)  {
//                self.init(no1:no1, no2:0)
//            }
//        }
//        let res = mainClass(no1: 20)
//        let show = subClass(no1: 30, no2: 50)
//
//        print("res is: \(res.no1)")
//        print("res is: \(show.no1)")
//        print("res is: \(show.no2)")
//
//        以上程序执行输出结果为：
//        res is: 20
//        res is: 30
//        res is: 50
        
        // 6、协议类型
        /*
         尽管协议本身并不实现任何功能，但是协议可以被当做类型来使用。
         协议可以像其他普通类型一样使用，使用场景:
         作为函数、方法或构造器中的参数类型或返回值类型
         作为常量、变量或属性的类型
         作为数组、字典或其他容器中的元素类型
         实例:
         */
//        protocol Generator {
//            associatedtype members
//            func next() -> members?
//        }
//
//        var items = [10,20,30].makeIterator()
//        while let x = items.next() {
//            print(x)
//        }
//
//        for lists in [1,2,3].map( {i in i*5}) {
//            print(lists)
//        }
//
//        print([100,200,300])
//        print([1,2,3].map({i in i*10}))
//
//        以上程序执行输出结果为：
//        10
//        20
//        30
//        5
//        10
//        15
//        [100, 200, 300]
//        [10, 20, 30]
        
        //7、在扩展中添加协议成员
        //我们可以可以通过扩展来扩充已存在类型( 类，结构体，枚举等)。
        //扩展可以为已存在的类型添加属性，方法，下标脚本，协议等成员。
//        protocol AgeClasificationProtocol {
//           var age: Int { get }
//           func agetype() -> String
//        }
//
//        class Person {
//           let firstname: String
//           let lastname: String
//           var age: Int
//           init(firstname: String, lastname: String) {
//              self.firstname = firstname
//              self.lastname = lastname
//              self.age = 10
//           }
//        }
//
//        extension Person : AgeClasificationProtocol {
//           func fullname() -> String {
//              var c: String
//              c = firstname + " " + lastname
//              return c
//           }
//
//           func agetype() -> String {
//              switch age {
//              case 0...2:
//                 return "Baby"
//              case 2...12:
//                 return "Child"
//              case 13...19:
//                 return "Teenager"
//              case let x where x > 65:
//                 return "Elderly"
//              default:
//                 return "Normal"
//              }
//           }
//        }
        
        
        // 8、协议的继承
        // 协议能够继承一个或多个其他协议，可以在继承的协议基础上增加新的内容要求。
        // 协议的继承语法与类的继承相似，多个被继承的协议间用逗号分隔：
//        protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
//            // 协议定义
//        }
//        实例
//        protocol Classa {
//            var no1: Int { get set }
//            func calc(sum: Int)
//        }
//
//        protocol Result {
//            func print(target: Classa)
//        }
//
//        class Student2: Result {
//            func print(target: Classa) {
//                target.calc(1)
//            }
//        }
//
//        class Classb: Result {
//            func print(target: Classa) {
//                target.calc(5)
//            }
//        }
//
//        class Student: Classa {
//            var no1: Int = 10
//
//            func calc(sum: Int) {
//                no1 -= sum
//                print("学生尝试 \(sum) 次通过")
//
//                if no1 <= 0 {
//                    print("学生缺席考试")
//                }
//            }
//        }
//
//        class Player {
//            var stmark: Result!
//
//            init(stmark: Result) {
//                self.stmark = stmark
//            }
//
//            func print(target: Classa) {
//                stmark.print(target)
//            }
//        }
//
//        var marks = Player(stmark: Student2())
//        var marksec = Student()
//
//        marks.print(marksec)
//        marks.print(marksec)
//        marks.print(marksec)
//        marks.stmark = Classb()
//        marks.print(marksec)
//        marks.print(marksec)
//        marks.print(marksec)
//        以上程序执行输出结果为：
//        学生尝试 1 次通过
//        学生尝试 1 次通过
//        学生尝试 1 次通过
//        学生尝试 5 次通过
//        学生尝试 5 次通过
//        学生缺席考试
//        学生尝试 5 次通过
//        学生缺席考试
        
        
        
        // 9、类专属协议
        // 你可以在协议的继承列表中,通过添加class关键字,限制协议只能适配到类（class）类型。
        // 该class关键字必须是第一个出现在协议的继承列表中，其后，才是其他继承协议。格式如下：
//        protocol SomeClassOnlyProtocol: class, SomeInheritedProtocol {
//            // 协议定义
//        }
//        实例
//        protocol TcpProtocol {
//            init(no1: Int)
//        }
//
//        class MainClass {
//            var no1: Int // 局部变量
//            init(no1: Int) {
//                self.no1 = no1 // 初始化
//            }
//        }
//
//        class SubClass: MainClass, TcpProtocol {
//            var no2: Int
//            init(no1: Int, no2 : Int) {
//                self.no2 = no2
//                super.init(no1:no1)
//            }
//            // 因为遵循协议，需要加上"required"; 因为继承自父类，需要加上"override"
//            required override convenience init(no1: Int)  {
//                self.init(no1:no1, no2:0)
//            }
//        }
//
//        let res = MainClass(no1: 20)
//        let show = SubClass(no1: 30, no2: 50)
//
//        print("res is: \(res.no1)")
//        print("res is: \(show.no1)")
//        print("res is: \(show.no2)")
//        以上程序执行输出结果为：
//        res is: 20
//        res is: 30
//        res is: 50
        
        
        
        // 10、协议合成
        //Swift 支持合成多个协议，这在我们需要同时遵循多个协议时非常有用。
//        语法格式如下：
//        protocol Stname {
//            var name: String { get }
//        }
//
//        protocol Stage {
//            var age: Int { get }
//        }
//
//        struct Person: Stname, Stage {
//            var name: String
//            var age: Int
//        }
//
//        func show(celebrator: Stname & Stage) {
//            print("\(celebrator.name) is \(celebrator.age) years old")
//        }
//
//        let studname = Person(name: "Priya", age: 21)
//        print(studname)
//
//        let stud = Person(name: "Rehan", age: 29)
//        print(stud)
//
//        let student = Person(name: "Roshan", age: 19)
//        print(student)
//        以上程序执行输出结果为：
//        Person(name: "Priya", age: 21)
//        Person(name: "Rehan", age: 29)
//        Person(name: "Roshan", age: 19)
        
        
        // 11、检验协议的一致性
        /*
         你可以使用is和as操作符来检查是否遵循某一协议或强制转化为某一类型。
         is操作符用来检查实例是否遵循了某个协议。
         as?返回一个可选值，当实例遵循协议时，返回该协议类型;否则返回nil。
         as用以强制向下转型，如果强转失败，会引起运行时错误。
         
         实例:
         下面的例子定义了一个 HasArea 的协议，要求有一个Double类型可读的 area：
         */
//        protocol HasArea {
//            var area: Double { get }
//        }
//
//        // 定义了Circle类，都遵循了HasArea协议
//        class Circle: HasArea {
//            let pi = 3.1415927
//            var radius: Double
//            var area: Double { return pi * radius * radius }
//            init(radius: Double) { self.radius = radius }
//        }
//
//        // 定义了Country类，都遵循了HasArea协议
//        class Country: HasArea {
//            var area: Double
//            init(area: Double) { self.area = area }
//        }
//
//        // Animal是一个没有实现HasArea协议的类
//        class Animal {
//            var legs: Int
//            init(legs: Int) { self.legs = legs }
//        }
//
//        let objects: [AnyObject] = [
//            Circle(radius: 2.0),
//            Country(area: 243_610),
//            Animal(legs: 4)
//        ]
//
//        for object in objects {
//            // 对迭代出的每一个元素进行检查，看它是否遵循了HasArea协议
//            if let objectWithArea = object as? HasArea {
//                print("面积为 \(objectWithArea.area)")
//            } else {
//                print("没有面积")
//            }
//        }
//        以上程序执行输出结果为：
//        面积为 12.5663708
//        面积为 243610.0
//        没有面积
    }
    
    func extensionLearn() {
        // 扩展
        
        /*
         扩展就是向一个已有的类、结构体或枚举类型添加新功能。
         扩展可以对一个类型添加新的功能，但是不能重写已有的功能。
         
         Swift 中的扩展可以：
         【1】添加计算型属性和计算型静态属性
         【2】定义实例方法和类型方法
         【3】提供新的构造器
         【4】定义下标
         【5】定义和使用新的嵌套类型
         【6】使一个已有类型符合某个协议
         
         语法：
         扩展声明使用关键字 extension：
         extension SomeType {
             // 加到SomeType的新功能写到这里
         }
         
         一个扩展可以扩展一个已有类型，使其能够适配一个或多个协议，语法格式如下：
         extension SomeType: SomeProtocol, AnotherProctocol {
             // 协议实现写到这里
         }
         */
        
        
        // 1、计算型属性
        /*
         扩展可以向已有类型添加计算型实例属性和计算型类型属性。
         
         实例:
         下面的例子向 Int 类型添加了 5 个计算型实例属性并扩展其功能：
         */
        print("1、计算型属性")
//        extension Int {
//           var add: Int {return self + 100 }
//           var sub: Int { return self - 10 }
//           var mul: Int { return self * 10 }
//           var div: Int { return self / 5 }
//        }
//
//        let addition = 3.add
//        print("加法运算后的值：\(addition)")
//
//        let subtraction = 120.sub
//        print("减法运算后的值：\(subtraction)")
//
//        let multiplication = 39.mul
//        print("乘法运算后的值：\(multiplication)")
//
//        let division = 55.div
//        print("除法运算后的值: \(division)")
//
//        let mix = 30.add + 34.sub
//        print("混合运算结果：\(mix)")
        
        // 2、构造器
        /*
         扩展可以向已有类型添加新的构造器。
         这可以让你扩展其它类型，将你自己的定制类型作为构造器参数，或者提供该类型的原始实现中没有包含的额外初始化选项。
         扩展可以向类中添加新的便利构造器 init()，但是它们不能向类中添加新的指定构造器或析构函数 deinit() 。
         */
        print("2、构造器")
//        struct sum {
//            var num1 = 100, num2 = 200
//        }
//
//        struct diff {
//            var no1 = 200, no2 = 100
//        }
//
//        struct mult {
//            var a = sum()
//            var b = diff()
//        }
//
//        extension mult {
//            init(x: sum, y: diff) {
//                _ = x.num1 + x.num2
//                _ = y.no1 + y.no2
//            }
//        }
//
//        let a = sum(num1: 100, num2: 200)
//        let b = diff(no1: 200, no2: 100)
//
//        let getMult = mult(x: a, y: b)
//        print("getMult sum\(getMult.a.num1, getMult.a.num2)")
//        print("getMult diff\(getMult.b.no1, getMult.b.no2)")
        /*
         这个topics方法使用了一个() -> ()类型的单参数，表明函数没有参数而且没有返回值。
         定义该扩展之后，你就可以对任意整数调用 topics 方法,实现的功能则是多次执行某任务：
         */
        
        
        // 3、可变实例方法
        /*
         通过扩展添加的实例方法也可以修改该实例本身。
         结构体和枚举类型中修改self或其属性的方法必须将该实例方法标注为mutating，正如来自原始实现的修改方法一样。
         
         实例:
         下面的例子向 Swift 的 Double 类型添加了一个新的名为 square 的修改方法，来实现一个原始值的平方计算：
         */
        print("3、可变实例方法")
//        extension Double {
//           mutating func square() {
//              let pi = 3.1415
//              self = pi * self * self
//           }
//        }
//
//        var Trial1 = 3.3
//        Trial1.square()
//        print("圆的面积为: \(Trial1)")
//
//
//        var Trial2 = 5.8
//        Trial2.square()
//        print("圆的面积为: \(Trial2)")
//
//
//        var Trial3 = 120.3
//        Trial3.square()
//        print("圆的面积为: \(Trial3)")
        
        
        // 4、下标
        /*
         扩展可以向一个已有类型添加新下标。
         
         实例:
         以下例子向 Swift 内建类型Int添加了一个整型下标。该下标[n]返回十进制数字
         */
//        extension Int {
//           subscript(var multtable: Int) -> Int {
//              var no1 = 1
//              while multtable > 0 {
//                 no1 *= 10
//                 --multtable
//              }
//              return (self / no1) % 10
//           }
//        }
//
//        print(12[0])
//        print(7869[1])
//        print(786543[2])
        
        
        // 5、嵌套类型
        // 扩展可以向已有的类、结构体和枚举添加新的嵌套类型：
//        extension Int {
//           enum calc
//           {
//              case add
//              case sub
//              case mult
//              case div
//              case anything
//           }
//
//           var print: calc {
//              switch self
//              {
//                 case 0:
//                    return .add
//                 case 1:
//                    return .sub
//                 case 2:
//                    return .mult
//                 case 3:
//                    return .div
//                 default:
//                    return .anything
//               }
//           }
//        }
//
//        func result(numb: [Int]) {
//           for i in numb {
//              switch i.print {
//                 case .add:
//                    print(" 10 ")
//                  case .sub:
//                    print(" 20 ")
//                 case .mult:
//                 print(" 30 ")
//                 case .div:
//                 print(" 40 ")
//                 default:
//                 print(" 50 ")
//
//              }
//           }
//        }
//
//        result([0, 1, 2, 3, 4, 7])
        
        
    }
    
    func typeExchange() {
        // 类型转换
        /*
         Swift 语言类型转换可以判断实例的类型。也可以用于检测实例类型是否属于其父类或者子类的实例。
         Swift 中类型转换使用 is 和 as 操作符实现，is 用于检测值的类型，as 用于转换类型。
         类型转换也可以用来检查一个类是否实现了某个协议。
         */
        
        // 1、定义一个类层次
        // 以下定义了三个类：Subjects、Chemistry、Maths，Chemistry 和 Maths 继承了 Subjects。
        class Subjects {
            var physics: String
            init(physics: String) {
                self.physics = physics
            }
        }

        class Chemistry: Subjects {
            var equations: String
            init(physics: String, equations: String) {
                self.equations = equations
                super.init(physics: physics)
            }
        }

        class Maths: Subjects {
            var formulae: String
            init(physics: String, formulae: String) {
                self.formulae = formulae
                super.init(physics: physics)
            }
        }

        let sa = [
            Chemistry(physics: "固体物理", equations: "赫兹"),
            Maths(physics: "流体动力学", formulae: "千兆赫"),
            Chemistry(physics: "热物理学", equations: "分贝"),
            Maths(physics: "天体物理学", formulae: "兆赫"),
            Maths(physics: "微分方程", formulae: "余弦级数")]


        let samplechem = Chemistry(physics: "固体物理", equations: "赫兹")
        print("实例物理学是: \(samplechem.physics)")
        print("实例方程式: \(samplechem.equations)")


        let samplemaths = Maths(physics: "流体动力学", formulae: "千兆赫")
        print("实例物理学是: \(samplemaths.physics)")
        print("实例公式是: \(samplemaths.formulae)")
        
        
        // 2、检查类型
        /*
         类型转换用于检测实例类型是否属于特定的实例类型。
         你可以将它用在类和子类的层次结构上，检查特定类实例的类型并且转换这个类实例的类型成为这个层次结构中的其他类型。
         类型检查使用 is 关键字。
         操作符 is 来检查一个实例是否属于特定子类型。若实例属于那个子类型，类型检查操作符返回 true，否则返回 false。
         */
        print("2、检查类型")
        var chemCount2 = 0
        var mathsCount2 = 0
        for item in sa {
            // 如果是一个 Chemistry 类型的实例，返回 true，相反返回 false。
            if item is Chemistry {
                chemCount2 += 1
            } else if item is Maths {
                mathsCount2 += 1
            }
        }
        print("化学科目包含 \(chemCount2) 个主题，数学包含 \(mathsCount2) 个主题")
        
        // 3、向下转型
        /*
         向下转型，用类型转换操作符(as? 或 as!)
         当你不确定向下转型可以成功时，用类型转换的条件形式(as?)。条件形式的类型转换总是返回一个可选值（optional value），并且若下转是不可能的，可选值将是 nil。
         只有你可以确定向下转型一定会成功时，才使用强制形式(as!)。当你试图向下转型为一个不正确的类型时，强制形式的类型转换会触发一个运行时错误。
         */
        print("3、向下转型")
        for item in sa {
            // 类型转换的条件形式
            if let show = item as? Chemistry {
                print("化学主题是: '\(show.physics)', \(show.equations)")
                // 强制形式
            } else if let example = item as? Maths {
                print("数学主题是: '\(example.physics)',  \(example.formulae)")
            }
        }
        
        
        // 4、Any和AnyObject的类型转换
        /*
         Swift为不确定类型提供了两种特殊类型别名：
         【1】AnyObject可以代表任何class类型的实例。
         【2】Any可以表示任何类型，包括方法类型（function types）。
         注意：
         只有当你明确的需要它的行为和功能时才使用Any和AnyObject。在你的代码里使用你期望的明确的类型总是更好的。
         */

        // 4.1 Any 实例
        // 可以存储Any类型的数组 exampleany
        print("4.1 Any 实例")
        var exampleany = [Any]()

        exampleany.append(12)
        exampleany.append(3.14159)
        exampleany.append("Any 实例")
        exampleany.append(Chemistry(physics: "固体物理", equations: "兆赫"))

        for item2 in exampleany {
            switch item2 {
            case let someInt as Int:
                print("整型值为 \(someInt)")
            case let someDouble as Double where someDouble > 0:
                print("Pi 值为 \(someDouble)")
            case let someString as String:
                print("\(someString)")
            case let phy as Chemistry:
                print("主题 '\(phy.physics)', \(phy.equations)")
            default:
                print("None")
            }
        }
        
        // 4.2、AnyObject 实例
        // [AnyObject] 类型的数组
        print("4.2、AnyObject 实例")
        let saprint: [AnyObject] = [
            Chemistry(physics: "固体物理", equations: "赫兹"),
            Maths(physics: "流体动力学", formulae: "千兆赫"),
            Chemistry(physics: "热物理学", equations: "分贝"),
            Maths(physics: "天体物理学", formulae: "兆赫"),
            Maths(physics: "微分方程", formulae: "余弦级数")]
       
        for item in saprint {
            // 类型转换的条件形式
            if let show = item as? Chemistry {
                print("化学主题是: '\(show.physics)', \(show.equations)")
                // 强制形式
            } else if let example = item as? Maths {
                print("数学主题是: '\(example.physics)',  \(example.formulae)")
            }
        }
    
        for item2 in exampleany {
            switch item2 {
            case let someInt as Int:
                print("整型值为 \(someInt)")
            case let someDouble as Double where someDouble > 0:
                print("Pi 值为 \(someDouble)")
            case let someString as String:
                print("\(someString)")
            case let phy as Chemistry:
                print("主题 '\(phy.physics)', \(phy.equations)")
            default:
                print("None")
            }
        }
    }
    
    func arcLearn() {
        // 自动引用计数
        
        /*
         Swift 使用自动引用计数（ARC）这一机制来跟踪和管理应用程序的内存
         通常情况下我们不需要去手动释放内存，因为 ARC 会在类的实例不再被使用时，自动释放其占用的内存。
         但在有些时候我们还是需要在代码中实现内存管理。
         */
        
        // 1、ARC 功能
        /*
         [1]当每次使用 init() 方法创建一个类的新的实例的时候，ARC 会分配一大块内存用来储存实例的信息。
         [2]内存中会包含实例的类型信息，以及这个实例所有相关属性的值。
         [3]当实例不再被使用时，ARC 释放实例所占用的内存，并让释放的内存能挪作他用。
         [4]为了确保使用中的实例不会被销毁，ARC 会跟踪和计算每一个实例正在被多少属性，常量和变量所引用。
         [5]实例赋值给属性、常量或变量，它们都会创建此实例的强引用，只要强引用还在，实例是不允许被销毁的。
         */
        
        // 2、ARC 实例
        class Person {
            let name: String
            var apartment: Apartment?
            init(name: String) {
                self.name = name
                print("\(name) 开始初始化")
            }
            deinit {
                print("\(name) 被析构")
            }
        }
        
        class Apartment {
            let number: Int
            init(number: Int) { self.number = number }
            var tenant: Person?
            deinit { print("Apartment #\(number) 被析构") }
        }

        // 值会被自动初始化为nil，目前还不会引用到Person类的实例
        var reference1: Person?
        var reference2: Person?
        var reference3: Person?

        // 创建Person类的新实例
        reference1 = Person(name: "Runoob")


        //赋值给其他两个变量，该实例又会多出两个强引用
        reference2 = reference1
        reference3 = reference1

        //断开第一个强引用
        reference1 = nil
        //断开第二个强引用
        reference2 = nil
        //断开第三个强引用，并调用析构函数
        reference3 = nil
        
        // 2、类实例之间的循环强引用
        /*
         在上面的例子中，ARC 会跟踪你所新创建的 Person 实例的引用数量，并且会在 Person 实例不再被需要时销毁它。
         然而，我们可能会写出这样的代码，一个类永远不会有0个强引用。这种情况发生在两个类实例互相保持对方的强引用，并让对方不被销毁。这就是所谓的循环强引用。
         实例：
            下面展示了一个不经意产生循环强引用的例子。例子定义了两个类：Person和Apartment，用来建模公寓和它其中的居民:
         */
        // 两个变量都被初始化为nil
        var runoob: Person?
        var number73: Apartment?

        // 赋值
        runoob = Person(name: "Runoob")
        number73 = Apartment(number: 73)

        // 意感叹号是用来展开和访问可选变量 runoob 和 number73 中的实例
        // 循环强引用被创建
        runoob!.apartment = number73
        number73!.tenant = runoob

        // 断开 runoob 和 number73 变量所持有的强引用时，引用计数并不会降为 0，实例也不会被 ARC 销毁
        // 注意，当你把这两个变量设为nil时，没有任何一个析构函数被调用。
        // 强引用循环阻止了Person和Apartment类实例的销毁，并在你的应用程序中造成了内存泄漏
        runoob = nil
        number73 = nil
        
        // 3、解决实例之间的循环强引用
        /*
         Swift 提供了两种办法用来解决你在使用类的属性时所遇到的循环强引用问题：
         【1】弱引用
         【2】无主引用
         弱引用和无主引用允许循环引用中的一个实例引用另外一个实例而不保持强引用。这样实例能够互相引用而不产生循环强引用。
         对于生命周期中会变为nil的实例使用弱引用。相反的，对于初始化赋值后再也不会被赋值为nil的实例，使用无主引用。
         */
        
        // 4、弱引用实例
        class Module {
            let name: String
            init(name: String) { self.name = name }
            var sub: SubModule?
            deinit { print("\(name) 主模块") }
        }

        class SubModule {
            let number: Int
            
            init(number: Int) { self.number = number }
            
            weak var topic: Module?
            
            deinit { print("子模块 topic 数为 \(number)") }
        }

        var toc: Module?
        var list: SubModule?
        toc = Module(name: "ARC")
        list = SubModule(number: 4)
        toc!.sub = list
        list!.topic = toc

        toc = nil
        list = nil
        
        // 5、无主引用实例
        class Student {
            let name: String
            var section: Marks?
            
            init(name: String) {
                self.name = name
            }
            
            deinit { print("\(name)") }
        }
        class Marks {
            let marks: Int
            unowned let stname: Student
            
            init(marks: Int, stname: Student) {
                self.marks = marks
                self.stname = stname
            }
            
            deinit { print("学生的分数为 \(marks)") }
        }

        var module: Student?
        module = Student(name: "ARC")
        module!.section = Marks(marks: 98, stname: module!)
        module = nil
        
        
        // 6、闭包引起的循环强引用
        /*
         循环强引用还会发生在当你将一个闭包赋值给类实例的某个属性，并且这个闭包体中又使用了实例。这个闭包体中可能访问了实例的某个属性，例如self.someProperty，或者闭包中调用了实例的某个方法，例如self.someMethod。这两种情况都导致了闭包 "捕获" self，从而产生了循环强引用。
         
         实例:
         下面的例子为你展示了当一个闭包引用了self后是如何产生一个循环强引用的。例子中定义了一个叫HTMLElement的类，用一种简单的模型表示 HTML 中的一个单独的元素：
         */
        class HTMLElement {
            
            let name: String
            let text: String?
            
            lazy var asHTML: () -> String = {
                if let text = self.text {
                    return "<\(self.name)>\(text)</\(self.name)>"
                } else {
                    return "<\(self.name) />"
                }
            }
            
            init(name: String, text: String? = nil) {
                self.name = name
                self.text = text
            }
            
            deinit {
                print("\(name) is being deinitialized")
            }
        }
        // 创建实例并打印信息
        var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
        print(paragraph!.asHTML())
        /*
         HTMLElement 类产生了类实例和 asHTML 默认值的闭包之间的循环强引用。
         实例的 asHTML 属性持有闭包的强引用。但是，闭包在其闭包体内使用了self（引用了self.name和self.text），因此闭包捕获了self，这意味着闭包又反过来持有了HTMLElement实例的强引用。这样两个对象就产生了循环强引用。
         解决闭包引起的循环强引用:在定义闭包时同时定义捕获列表作为闭包的一部分，通过这种方式可以解决闭包和类实例之间的循环强引用。
         */
        
        
        // 7、弱引用和无主引用
        /*
         当闭包和捕获的实例总是互相引用时并且总是同时销毁时，将闭包内的捕获定义为无主引用。
         相反的，当捕获引用有时可能会是nil时，将闭包内的捕获定义为弱引用。
         如果捕获的引用绝对不会置为nil，应该用无主引用，而不是弱引用。
         实例:
         前面的HTMLElement例子中，无主引用是正确的解决循环强引用的方法。这样编写HTMLElement类来避免循环强引用：
         */
        class HTMLElement2 {
            
            let name: String
            let text: String?
            
            lazy var asHTML: () -> String = {
                [unowned self] in
                if let text = self.text {
                    return "<\(self.name)>\(text)</\(self.name)>"
                } else {
                    return "<\(self.name) />"
                }
            }
            
            init(name: String, text: String? = nil) {
                self.name = name
                self.text = text
            }
            
            deinit {
                print("\(name) 被析构")
            }
            
        }

        //创建并打印HTMLElement实例
        var paragraph2: HTMLElement2? = HTMLElement2(name: "p", text: "hello, world")
        print(paragraph2!.asHTML())

        // HTMLElement实例将会被销毁，并能看到它的析构函数打印出的消息
        paragraph2 = nil
    }
    
    func optionalChainingLearn() {
        // 可选链
        /*
         可选链（Optional Chaining）是一种可以请求和调用属性、方法和子脚本的过程，用于请求或调用的目标可能为nil。
         可选链返回两个值：
         [1]如果目标有值，调用就会成功，返回该值
         [2]如果目标为nil，调用将返回nil
         
         多次请求或调用可以被链接成一个链，如果任意一个节点为nil将导致整条链失效。
         */
        
        // 1、可选链可替代强制解析
        /*
         通过在属性、方法、或下标脚本的可选值后面放一个问号(?)，即可定义一个可选链。
         【1】可选
         可选链 '?'
         ? 放置于可选值后来调用方法，属性，下标脚本
         当可选为 nil 输出比较友好的错误信息
         【2】强制
         感叹号（!）强制展开方法，属性，下标脚本可选链
         ! 放置于可选值后来调用方法，属性，下标脚本来强制展开值
         当可选为 nil 时强制展开执行错误
         */
        
        // 2、使用感叹号(!)可选链实例
        print("使用感叹号(!)可选链实例")
        class Person {
            var residence: Residence?
        }

        class Residence {
            var numberOfRooms = 1
        }
        let john = Person()
        //将导致运行时错误
//        let roomCount = john.residence!.numberOfRooms     // 运行crash
        // 想使用感叹号（!）强制解析获得这个人residence属性numberOfRooms属性值，将会引发运行时错误，因为这时没有可以供解析的residence值。
        
        // 3、使用问号(?)可选链实例
        print("使用问号(?)可选链实例")
        class Person1 {
            var residence: Residence?
        }

        class Residence1 {
            var numberOfRooms = 1
        }

        let john1 = Person1()
        // 链接可选residence?属性，如果residence存在则取回numberOfRooms的值
        if let roomCount = john1.residence?.numberOfRooms {
            print("John 的房间号为 \(roomCount)。")
        } else {
            print("不能查看房间号")
        }
        /*
         因为这种尝试获得numberOfRooms的操作有可能失败，可选链会返回Int?类型值，或者称作"可选Int"。当residence是空的时候（上例），选择Int将会为空，因此会出现无法访问numberOfRooms的情况。
         要注意的是，即使numberOfRooms是非可选Int（Int?）时这一点也成立。只要是通过可选链的请求就意味着最后numberOfRooms总是返回一个Int?而不是Int。
         */
        
        
        // 4、为可选链定义模型类
        /*
         你可以使用可选链来多层调用属性，方法，和下标脚本。这让你可以利用它们之间的复杂模型来获取更底层的属性，并检查是否可以成功获取此类底层属性。
         
         实例:
            定义了四个模型类，其中包括多层可选链：
         */
        print("4、为可选链定义模型类")
        class Person2 {
            var residence: Residence2?
        }

        // 定义了一个变量rooms，它被初始化为一个Room[]类型的空数组
        class Residence2 {
            var rooms = [Room2]()
            var numberOfRooms: Int {
                return rooms.count
            }
            subscript(i: Int) -> Room2 {
                return rooms[i]
            }
            func printNumberOfRooms() {
                print("房间号为 \(numberOfRooms)")
            }
            var address: Address2?
        }

        // Room 定义一个name属性和一个设定room名的初始化器
        class Room2 {
            let name: String
            init(name: String) { self.name = name }
        }

        // 模型中的最终类叫做Address
        class Address2 {
            var buildingName: String?
            var buildingNumber: String?
            var street: String?
            func buildingIdentifier() -> String? {
                if (buildingName != nil) {
                    return buildingName
                } else if (buildingNumber != nil) {
                    return buildingNumber
                } else {
                    return nil
                }
            }
        }
        
        
        // 5、通过可选链调用方法
        // 你可以使用可选链的来调用可选值的方法并检查方法调用是否成功。即使这个方法没有返回值，你依然可以使用可选链来达成这一目的。
        print("5、通过可选链调用方法")
        let john5 = Person2()
        if ((john5.residence?.printNumberOfRooms()) != nil) {
            print("输出房间号")
        } else {
            print("无法输出房间号")
        }
        // 使用if语句来检查是否能成功调用printNumberOfRooms方法：如果方法通过可选链调用成功，printNumberOfRooms的隐式返回值将会是Void，如果没有成功，将返回nil。
        
        
        // 6、使用可选链调用下标脚本
        // 你可以使用可选链来尝试从下标脚本获取值并检查下标脚本的调用是否成功，然而，你不能通过可选链来设置下标脚本。
        print("6、使用可选链调用下标脚本")
        let john6 = Person2()
        if let firstRoomName = john6.residence?[0].name {
            print("第一个房间名 \(firstRoomName).")
        } else {
            print("无法检索到房间")
        }
        // 在下标脚本调用中可选链的问号直接跟在 circname.print 的后面，在下标脚本括号的前面，因为circname.print是可选链试图获得的可选值。
        // 实例2
        // 实例中创建一个Residence实例给john.residence，且在他的rooms数组中有一个或多个Room实例，那么你可以使用可选链通过Residence下标脚本来获取在rooms数组中的实例了：
        let john7 = Person2()
        let johnsHouse = Residence2()
        johnsHouse.rooms.append(Room2(name: "客厅"))
        johnsHouse.rooms.append(Room2(name: "厨房"))
        john7.residence = johnsHouse

        let johnsAddress = Address2()
        johnsAddress.buildingName = "The Larches"
        johnsAddress.street = "Laurel Street"
        john7.residence!.address = johnsAddress

        if let johnsStreet = john7.residence?.address?.street {
            print("John 所在的街道是 \(johnsStreet)。")
        } else {
            print("无法检索到地址。 ")
        }
        
        // 7、通过可选链接调用来访问下标
        // 通过可选链接调用，我们可以用下标来对可选值进行读取或写入，并且判断下标调用是否成功。
        let john8 = Person2()

        let johnsHouse8 = Residence2()
        johnsHouse8.rooms.append(Room2(name: "客厅"))
        johnsHouse8.rooms.append(Room2(name: "厨房"))
        john8.residence = johnsHouse8

        if let firstRoomName = john8.residence?[0].name {
            print("第一个房间名为\(firstRoomName)")
        } else {
            print("无法检索到房间")
        }
        
        
        // 8、访问可选类型的下标
        // 如果下标返回可空类型值，比如Swift中Dictionary的key下标。可以在下标的闭合括号后面放一个问号来链接下标的可空返回值：
        print(" 8、访问可选类型的下标")
        var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
        testScores["Dave"]?[0] = 91
        testScores["Bev"]?[0] += 1
        testScores["Brian"]?[0] = 72
        // the "Dave" array is now [91, 82, 84] and the "Bev" array is now [80, 94, 81]
        /*
         面的例子中定义了一个testScores数组，包含了两个键值对， 把String类型的key映射到一个整形数组。
         这个例子用可选链接调用把"Dave"数组中第一个元素设为91，把"Bev"数组的第一个元素+1，然后尝试把"Brian"数组中的第一个元素设为72。
         前两个调用是成功的，因为这两个key存在。但是key"Brian"在字典中不存在，所以第三个调用失败。
         */
        
        // 9、连接多层链接
        /*
         你可以将多层可选链连接在一起，可以掘取模型内更下层的属性方法和下标脚本。然而多层可选链不能再添加比已经返回的可选值更多的层。
         如果你试图通过可选链获得Int值，不论使用了多少层链接返回的总是Int?。 相似的，如果你试图通过可选链获得Int?值，不论使用了多少层链接返回的总是Int?。
         
         实例1:
         下面的例子试图获取john的residence属性里的address的street属性。这里使用了两层可选链来联系residence和address属性，它们两者都是可选类型：
         */
        print("9、连接多层链接")
        let john9 = Person2()

        if let johnsStreet = john9.residence?.address?.street {
            print("John 的地址为 \(johnsStreet).")
        } else {
            print("不能检索地址")
        }
        // 实例2
        // 如果你为Address设定一个实例来作为john.residence.address的值，并为address的street属性设定一个实际值，你可以通过多层可选链来得到这个属性值。
        class Person3 {
           var residence: Residence3?
        }

        class Residence3 {
            var rooms = [Room3]()
            var numberOfRooms: Int {
                return rooms.count
            }
            subscript(i: Int) -> Room3 {
                get{
                    return rooms[i]
                }
                set {
                    rooms[i] = newValue
                }
            }
            func printNumberOfRooms() {
                print("房间号为 \(numberOfRooms)")
            }
            var address: Address3?
        }

        class Room3 {
            let name: String
            init(name: String) { self.name = name }
        }

        class Address3 {
            var buildingName: String?
            var buildingNumber: String?
            var street: String?
            func buildingIdentifier() -> String? {
                if (buildingName != nil) {
                    return buildingName
                } else if (buildingNumber != nil) {
                    return buildingNumber
                } else {
                    return nil
                }
            }
        }
        let john10 = Person3()
        john10.residence?[0] = Room3(name: "浴室")

        let johnsHouse10 = Residence3()
        johnsHouse10.rooms.append(Room3(name: "客厅"))
        johnsHouse10.rooms.append(Room3(name: "厨房"))
        john10.residence = johnsHouse10

        if let firstRoomName = john10.residence?[0].name {
            print("第一个房间是\(firstRoomName)")
        } else {
            print("无法检索房间")
        }
        
        
        // 11、对返回可选值的函数进行链接
        // 我们还可以通过可选链接来调用返回可空值的方法，并且可以继续对可选值进行链接。
        let john11 = Person2()

        if john11.residence?.printNumberOfRooms() != nil {
            print("指定了房间号)")
        }  else {
            print("未指定房间号")
        }
    }
    
    func dellocLearn() {
        // 析构过程
        /*
         在一个类的实例被释放之前，析构函数被立即调用。用关键字deinit来标示析构函数，类似于初始化函数用init来标示。析构函数只适用于类类型。
         */
        
        // 1、析构过程原理
        /*
         Swift 会自动释放不再需要的实例以释放资源。
         Swift 通过自动引用计数（ARC）处理实例的内存管理。
         通常当你的实例被释放时不需要手动地去清理。但是，当使用自己的资源时，你可能需要进行一些额外的清理。
         例如，如果创建了一个自定义的类来打开一个文件，并写入一些数据，你可能需要在类实例被释放之前关闭该文件。
         
         语法 ：
            在类的定义中，每个类最多只能有一个析构函数。析构函数不带任何参数，在写法上不带括号：
         deinit {
             // 执行析构过程
         }

         */
        
        // 2、实例
        var counter = 0;  // 引用计数器
        class BaseClass {
            init() {
//                counter += 1;     // 验证请释放注释
            }
            deinit {
//                counter -= 1;     // 验证请释放注释
            }
        }
        
        var show: BaseClass? = BaseClass()
        print(counter)
//        show = nil            // 会执行deinit
        print(counter)
        
    }
    
    func initLearn() {
        // Swift 构造过程
        
        /*
         构造过程是为了使用某个类、结构体或枚举类型的实例而进行的准备过程。这个过程包含了为实例中的每个属性设置初始值和为其执行必要的准备和初始化任务。
         Swift 构造函数使用 init() 方法。
         与 Objective-C 中的构造器不同，Swift 的构造器无需返回值，它们的主要任务是保证新实例在第一次使用前完成正确的初始化。
         类实例也可以通过定义析构器（deinitializer）在类实例释放之前执行清理内存的工作。
         */
        
        // 1.1、swift 的构造器无需返回值
        
        // 1.2、存储型属性的初始赋值
        /*
         类和结构体在实例创建时，必须为所有存储型属性设置合适的初始值。
         存储属性在构造器中赋值时，它们的值是被直接设置的，不会触发任何属性观测器。
         存储属性在构造器中赋值流程：
            [1]创建初始值。
            [2]在属性定义中指定默认属性值。
            [3]初始化实例，并调用 init() 方法。
         */
        
        // 1.3、构造器
        /*
         构造器在创建某特定类型的新实例时调用。它的最简形式类似于一个不带任何参数的实例方法，以关键字init命名。
         语法
         init()
         {
         // 实例化后执行的代码
         }
         */
        
        
        // 1.4、实例
        // 以下结构体定义了一个不带参数的构造器 init，并在里面将存储型属性 length 和 breadth 的值初始化为 6 和 12：
        print("1.4、实例")
        struct rectangle {
            var length: Double
            var breadth: Double
            init() {
                length = 6
                breadth = 12
            }
        }
        let area = rectangle()
        print("矩形面积为 \(area.length*area.breadth)")
        
        
        // 1.5、默认属性值
        /*
         我们可以在构造器中为存储型属性设置初始值；同样，也可以在属性声明时为其设置默认值。
         使用默认值能让你的构造器更简洁、更清晰，且能通过默认值自动推导出属性的类型。
         以下实例我们在属性声明时为其设置默认值：
         */
        print("1.5、默认属性值")
        struct rectangle1 {
            // 设置默认值
            var length1 = 6
            var breadth1 = 12
        }
        let area1 = rectangle1()
        print("矩形的面积为 \(area1.length1*area1.breadth1)")
        
        
        // 1.6、构造参数
        // 你可以在定义构造器 init() 时提供构造参数，如下所示：
        print("1.6、构造参数")
        struct Rectangle {
            var length: Double
            var breadth: Double
            var area: Double
            
            init(fromLength length: Double, fromBreadth breadth: Double) {
                self.length = length
                self.breadth = breadth
                area = length * breadth
            }
            
            init(fromLeng leng: Double, fromBread bread: Double) {
                self.length = leng
                self.breadth = bread
                area = leng * bread
            }
        }

        let ar = Rectangle(fromLength: 6, fromBreadth: 12)
        print("面积为: \(ar.area)")

        let are = Rectangle(fromLeng: 36, fromBread: 12)
        print("面积为: \(are.area)")
        
        
        // 1.7、内部和外部参数名
        /*
         跟函数和方法参数相同，构造参数也存在一个在构造器内部使用的参数名字和一个在调用构造器时使用的外部参数名字。
         然而，构造器并不像函数和方法那样在括号前有一个可辨别的名字。所以在调用构造器时，主要通过构造器中的参数名和类型来确定需要调用的构造器。
         如果你在定义构造器时没有提供参数的外部名字，Swift 会为每个构造器的参数自动生成一个跟内部名字相同的外部名。
         */
        print("1.7、内部和外部参数名")
        struct Color {
            let red, green, blue: Double
            init(red: Double, green: Double, blue: Double) {
                self.red   = red
                self.green = green
                self.blue  = blue
            }
            init(white: Double) {
                red   = white
                green = white
                blue  = white
            }
        }

        // 创建一个新的Color实例，通过三种颜色的外部参数名来传值，并调用构造器
        let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)

        print("red 值为: \(magenta.red)")
        print("green 值为: \(magenta.green)")
        print("blue 值为: \(magenta.blue)")

        // 创建一个新的Color实例，通过三种颜色的外部参数名来传值，并调用构造器
        let halfGray = Color(white: 0.5)
        print("red 值为: \(halfGray.red)")
        print("green 值为: \(halfGray.green)")
        print("blue 值为: \(halfGray.blue)")
        
        
        // 1.8、没有外部名称参数
        // 如果你不希望为构造器的某个参数提供外部名字，你可以使用下划线_来显示描述它的外部名。
        print("1.8、没有外部名称参数")
        struct Rectangle2 {
            var length: Double
            
            init(frombreadth breadth: Double) {
                length = breadth * 10
            }
            
            init(frombre bre: Double) {
                length = bre * 30
            }
            //不提供外部名字
            init(_ area: Double) {
                length = area
            }
        }
        // 调用不提供外部名字
        let rectarea = Rectangle2(180.0)
        print("面积为: \(rectarea.length)")
        // 调用不提供外部名字
        let rearea = Rectangle2(370.0)
        print("面积为: \(rearea.length)")
        // 调用不提供外部名字
        let recarea = Rectangle2(110.0)
        print("面积为: \(recarea.length)")
        
        
        // 1.9、可选属性类型
        /*
         如果你定制的类型包含一个逻辑上允许取值为空的存储型属性，你都需要将它定义为可选类型optional type（可选属性类型）。
         当存储属性声明为可选时，将自动初始化为空 nil。
         */
        print("1.9、可选属性类型")
        struct Rectangle3 {
            var length: Double?
            
            init(frombreadth breadth: Double) {
                length = breadth * 10
            }
            
            init(frombre bre: Double) {
                length = bre * 30
            }
            
            init(_ area: Double) {
                length = area
            }
        }
        _ = Rectangle3(180.0)
        print("面积为：\(rectarea.length)")
        _ = Rectangle3(370.0)
        print("面积为：\(rearea.length)")
        let recarea1 = Rectangle3(110.0)
        print("面积为：\(recarea.length)")
        
        
        // 1.10、构造过程中修改常量属性
        /*
         只要在构造过程结束前常量的值能确定，你可以在构造过程中的任意时间点修改常量属性的值。
         对某个类实例来说，它的常量属性只能在定义它的类的构造过程中修改；不能在子类中修改。
         尽管 length 属性现在是常量，我们仍然可以在其类的构造器中设置它的值：
         */
        print("1.10、构造过程中修改常量属性")
        struct Rectangle4 {
            let length: Double?
            
            init(frombreadth breadth: Double) {
                length = breadth * 10
            }
            
            init(frombre bre: Double) {
                length = bre * 30
            }
            
            init(_ area: Double) {
                length = area
            }
        }

        _ = Rectangle4(180.0)
        print("面积为：\(rectarea.length)")
        let rearea4 = Rectangle4(370.0)
        print("面积为：\(rearea.length)")
        let recarea4 = Rectangle4(110.0)
        print("面积为：\(recarea.length)")
//        recarea.length = 2000   编译报错：不在构造内，常量不可更改
        
        
        // 1.11、默认构造器
        /*
         默认构造器将简单的创建一个所有属性值都设置为默认值的实例:
         以下实例中，ShoppingListItem类中的所有属性都有默认值，且它是没有父类的基类，它将自动获得一个可以为所有属性设置默认值的默认构造器
         */
        print("1.11、默认构造器")
        class ShoppingListItem {
            var name: String?
            var quantity = 1
            var purchased = false
        }
        let item = ShoppingListItem()
        print("名字为: \(String(describing: item.name))")
        print("数理为: \(item.quantity)")
        print("是否付款: \(item.purchased)")
        
        
        // 1.12、结构体的逐一成员构造器
        /*
         如果结构体对所有存储型属性提供了默认值且自身没有提供定制的构造器，它们能自动获得一个逐一成员构造器。
         我们在调用逐一成员构造器时，通过与成员属性名相同的参数名进行传值来完成对成员属性的初始赋值。
         下面例子中定义了一个结构体 Rectangle，它包含两个属性 length 和 breadth。Swift 可以根据这两个属性的初始赋值100.0 、200.0自动推导出它们的类型Double。
         */
        print("1.12、结构体的逐一成员构造器")
        struct Rectangle5 {
            var length = 100.0, breadth = 200.0
        }
        let area5 = Rectangle5(length: 24.0, breadth: 32.0)
        print("矩形的面积: \(area5.length)")
        print("矩形的面积: \(area5.breadth)")
        // 由于这两个存储型属性都有默认值，结构体 Rectangle 自动获得了一个逐一成员构造器 init(width:height:)。 你可以用它来为 Rectangle 创建新的实例。
        
        // 1.13、值类型的构造器代理
        /*
         构造器可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为构造器代理，它能减少多个构造器间的代码重复。
         以下实例中，Rect 结构体调用了 Size 和 Point 的构造过程：
         */
        print("1.13、值类型的构造器代理")
        struct Size {
            var width = 0.0
            var height = 0.0
        }
        struct Point {
            var x = 0.0, y = 0.0
        }

        struct Rect {
            var origin = Point()
            var size = Size()
            init() {}
            init(origin: Point, size: Size) {
                self.origin = origin
                self.size = size
            }
            init(center: Point, size: Size) {
                let originX = center.x - (size.width / 2)
                let originY = center.y - (size.height / 2)
                self.init(origin: Point(x: originX, y: originY), size: size)
            }
        }

        // origin和size属性都使用定义时的默认值Point(x: 0.0, y: 0.0)和Size(width: 0.0, height: 0.0)：
        let basicRect = Rect()
        print("Size 结构体初始值: \(basicRect.size.width),\(basicRect.size.height) ")
        print("Rect 结构体初始值: \(basicRect.origin.x),\(basicRect.origin.y) ")

        // 将origin和size的参数值赋给对应的存储型属性
        let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
            size: Size(width: 5.0, height: 5.0))

        print("Size 结构体初始值: \(originRect.size.width),\(originRect.size.height) ")
        print("Rect 结构体初始值: \(originRect.origin.x),\(originRect.origin.y) ")


        //先通过center和size的值计算出origin的坐标。
        //然后再调用（或代理给）init(origin:size:)构造器来将新的origin和size值赋值到对应的属性中
        let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
            size: Size(width: 3.0, height: 3.0))

        print("Size 结构体初始值: \(centerRect.size.width),\(centerRect.size.height) ")
        print("Rect 结构体初始值: \(centerRect.origin.x),\(centerRect.origin.y) ")
        
        
        // 1.14、构造器代理规则
        /*
         【1】值类型:不支持继承，所以构造器代理的过程相对简单，因为它们只能代理给本身提供的其它构造器。
         你可以使用self.init在自定义的构造器中引用其它的属于相同值类型的构造器。    【2】类类型:它可以继承自其它类,这意味着类有责任保证其所有继承的存储型属性在构造时也能正确的初始化。
         */
        
        // 2、类的继承和构造过程
        /*
         指定构造器
         【1】类中最主要的构造器
         【2】初始化类中提供的所有属性，并根据父类链往上调用父类的构造器来实现父类的初始化。
         【3】每一个类都必须拥有至少一个指定构造器
         Init(parameters) {
         statements
         }
         便利构造器
         【1】类中比较次要的、辅助型的构造器
         【2】可以定义便利构造器来调用同一个类中的指定构造器，并为其参数提供默认值。你也可以定义便利构造器来创建一个特殊用途或特定输入的实例。
         【3】只在必要的时候为类提供便利构造器
         convenience init(parameters) {
         statements
         }
         */
        
        
        // 2.1 指定构造器实例
        print("指定构造器实例")
        class mainClass {
            var no1 : Int // 局部存储变量
            init(no1 : Int) {
                self.no1 = no1 // 初始化
            }
        }
        class subClass : mainClass {
            var no2 : Int // 新的子类存储变量
            init(no1 : Int, no2 : Int) {
                self.no2 = no2 // 初始化
                super.init(no1:no1) // 初始化超类
            }
        }
        let res = mainClass(no1: 10)
        let res2 = subClass(no1: 10, no2: 20)
        print("res 为: \(res.no1)")
        print("res2 为: \(res2.no1)")
        print("res2 为: \(res2.no2)")
        
        
        // 2.3 便利构造器实例
        print("便利构造器实例")
        class mainClass2 {
            var no1 : Int // 局部存储变量
            init(no1 : Int) {
                self.no1 = no1 // 初始化
            }
        }
        class subClass2 : mainClass {
            var no2 : Int
            init(no1 : Int, no2 : Int) {
                self.no2 = no2
                super.init(no1:no1)
            }
            // 便利方法只需要一个参数
            override convenience init(no1: Int) {
                self.init(no1:no1, no2:0)
            }
        }
        let res3 = mainClass2(no1: 20)
        let res33 = subClass2(no1: 30, no2: 50)
        print("res 为: \(res3.no1)")
        print("res2 为: \(res33.no1)")
        print("res2 为: \(res33.no2)")
        
        
        // 2.4 构造器的继承和重载
        /*
         Swift 中的子类不会默认继承父类的构造器。
         父类的构造器仅在确定和安全的情况下被继承。
         当你重写一个父类指定构造器时，你需要写override修饰符。
         */
        print("构造器的继承和重载")
        class SuperClass3 {
            var corners = 4
            var description: String {
                return "\(corners) 边"
            }
        }
        let rectangle2 = SuperClass3()
        print("矩形: \(rectangle2.description)")

        class SubClass3: SuperClass3 {
            override init() {  //重载构造器
                super.init()
                corners = 5
            }
        }
        let subClass3 = SubClass3()
        print("五角型: \(subClass3.description)")
        
        // 2.5 指定构造器和便利构造器实例
        /*
         接下来的例子将在操作中展示指定构造器、便利构造器和自动构造器的继承。
         它定义了包含两个个类MainClass、SubClass的类层次结构，并将演示它们的构造器是如何相互作用的。
         */
        print("指定构造器和便利构造器实例")
        class MainClass {
            var name: String
            init(name: String) {
                self.name = name
            }
            convenience init() {
                self.init(name: "[匿名]")
            }
        }
        let main = MainClass(name: "Runoob")
        print("MainClass 名字为: \(main.name)")
        let main2 = MainClass()
        print("没有对应名字: \(main2.name)")
        class SubClass5: MainClass {
            var count: Int
            init(name: String, count: Int) {
                self.count = count
                super.init(name: name)
            }
            override convenience init(name: String) {
                self.init(name: name, count: 1)
            }
        }
        let sub = SubClass5(name: "Runoob")
        print("MainClass 名字为: \(sub.name)")
        let sub2 = SubClass5(name: "Runoob", count: 3)
        print("count 变量: \(sub2.count)")
        
        // 2.5 类的可失败构造器
        /*
         如果一个类，结构体或枚举类型的对象，在构造自身的过程中有可能失败，则为其定义一个可失败构造器。
         变量初始化失败可能的原因有：
         【1】传入无效的参数值。
         【2】缺少某种所需的外部资源。
         【3】没有满足特定条件。
         为了妥善处理这种构造过程中可能会失败的情况。
         你可以在一个类，结构体或是枚举类型的定义中，添加一个或多个可失败构造器。其语法为在init关键字后面加添问号(init?)。
         
         实例
         下例中，定义了一个名为Animal的结构体，其中有一个名为species的，String类型的常量属性。
         同时该结构体还定义了一个，带一个String类型参数species的,可失败构造器。这个可失败构造器，被用来检查传入的参数是否为一个空字符串，如果为空字符串，则该可失败构造器，构建对象失败，否则成功。
         */
        struct Animal {
            let species: String
            init?(species: String) {
                if species.isEmpty { return nil }
                self.species = species
            }
        }
        //通过该可失败构造器来构建一个Animal的对象，并检查其构建过程是否成功
        // someCreature 的类型是 Animal? 而不是 Animal
        let someCreature = Animal(species: "长颈鹿")
        
        // 打印 "动物初始化为长颈鹿"
        if let giraffe = someCreature {
            print("动物初始化为\(giraffe.species)")
        }
        
        // 2.6 枚举类型的可失败构造器
        /*
         你可以通过构造一个带一个或多个参数的可失败构造器来获取枚举类型中特定的枚举成员。
         
         实例:
            下例中，定义了一个名为TemperatureUnit的枚举类型。其中包含了三个可能的枚举成员(Kelvin，Celsius，和 Fahrenheit)和一个被用来找到Character值所对应的枚举成员的可失败构造器：
         */
        enum TemperatureUnit {
            // 开尔文，摄氏，华氏
            case Kelvin, Celsius, Fahrenheit
            init?(symbol: Character) {
                switch symbol {
                case "K":
                    self = .Kelvin
                case "C":
                    self = .Celsius
                case "F":
                    self = .Fahrenheit
                default:
                    return nil
                }
            }
        }

        let fahrenheitUnit = TemperatureUnit(symbol: "F")
        if fahrenheitUnit != nil {
            print("这是一个已定义的温度单位，所以初始化成功。")
        }

        let unknownUnit = TemperatureUnit(symbol: "X")
        if unknownUnit == nil {
            print("这不是一个已定义的温度单位，所以初始化失败。")
        }
        
        // 2.7 类的可失败构造器
        /*
         值类型（如结构体或枚举类型）的可失败构造器，对何时何地触发构造失败这个行为没有任何的限制。
         但是，类的可失败构造器只能在所有的类属性被初始化后和所有类之间的构造器之间的代理调用发生完后触发失败行为。
         实例
         下例子中，定义了一个名为 StudRecord 的类，因为 studname 属性是一个常量，所以一旦 StudRecord 类构造成功，studname 属性肯定有一个非nil的值。
         */
        class StudRecord1 {
            let studname: String!
            init?(studname: String) {
                self.studname = studname
                if studname.isEmpty { return nil }
            }
        }
        if let stname = StudRecord1(studname: "失败构造器") {
            print("模块为 \(stname.studname)")
        }
        
        // 2.8 覆盖一个可失败构造器
        /*
         就如同其它构造器一样，你也可以用子类的可失败构造器覆盖基类的可失败构造器。
         者你也可以用子类的非可失败构造器覆盖一个基类的可失败构造器。
         你可以用一个非可失败构造器覆盖一个可失败构造器，但反过来却行不通。
         一个非可失败的构造器永远也不能代理调用一个可失败构造器。
         
         
         实例
            以下实例描述了可失败与非可失败构造器：
         */
        class Planet {
            var name: String
            
            init(name: String) {
                self.name = name
            }
            
            convenience init() {
                self.init(name: "[No Planets]")
            }
        }
        let plName = Planet(name: "Mercury")
        print("行星的名字是: \(plName.name)")

        let noplName = Planet()
        print("没有这个名字的行星: \(noplName.name)")

        class planets: Planet {
            var count: Int
            
            init(name: String, count: Int) {
                self.count = count
                super.init(name: name)
            }
            
            override convenience init(name: String) {
                self.init(name: name, count: 1)
            }
        }
        
        // 2.9 可失败构造器 init!
        /*
         通常来说我们通过在init关键字后添加问号的方式（init?）来定义一个可失败构造器，但你也可以使用通过在init后面添加惊叹号的方式来定义一个可失败构造器(init!)。实例如下：
         */
        struct StudRecord {
            let stname: String
            
            init!(stname: String) {
                if stname.isEmpty {return nil }
                self.stname = stname
            }
        }

        let stmark = StudRecord(stname: "Runoob")
        if let name = stmark {
            print("指定了学生名")
        }

        let blankname = StudRecord(stname: "")
        if blankname == nil {
            print("学生名为空")
        }
    }
    
    func successionLearn() {
        // 继承

        /*
         继承我们可以理解为一个类获取了另外一个类的方法和属性。
         当一个类继承其它类时，继承类叫子类，被继承类叫超类（或父类)
         在 Swift 中，类可以调用和访问超类的方法，属性和下标脚本，并且可以重写它们。
         我们也可以为类中继承来的属性添加属性观察器。
         */
        
        // 1、基类
        /*
         没有继承其它类的类，称之为基类（Base Class）。
         以下实例中我们定义了基类 StudDetails ，描述了学生（stname）及其各科成绩的分数(mark1、mark2、mark3)：
         */
        print("1、基类")
        class StudDetails {
            var stname: String!
            var mark1: Int!
            var mark2: Int!
            var mark3: Int!
            init(stname: String, mark1: Int, mark2: Int, mark3: Int) {
                self.stname = stname
                self.mark1 = mark1
                self.mark2 = mark2
                self.mark3 = mark3
            }
        }
        let stname = "swift"
        let mark1 = 98
        let mark2 = 89
        let mark3 = 76
        let sds = StudDetails(stname:stname, mark1:mark1, mark2:mark2, mark3:mark3);
        print(sds.stname)
        print(sds.mark1)
        print(sds.mark2)
        print(sds.mark3)
        
        
        // 2、子类
        /*
         子类指的是在一个已有类的基础上创建一个新的类。
         为了指明某个类的超类，将超类名写在子类名的后面，用冒号(:)分隔,语法格式如下
         
         class SomeClass: SomeSuperclass {
             // 类的定义
         }
         */
        // 实例
        // 以下实例中我们定义了超类 StudDetails，然后使用子类 Tom 继承它：
        print("2、子类")
        class LearnDetail {
            var mark1: Int;
            var mark2: Int;
            
            init(stm1:Int, results stm2:Int) {
                mark1 = stm1;
                mark2 = stm2;
            }
            
            func show() {
                print("Mark1:\(self.mark1), Mark2:\(self.mark2)")
            }
        }

        class Tom : LearnDetail {
            init() {
                super.init(stm1: 93, results: 89)
            }
        }

        let tom = Tom()
        tom.show()
        
        
        // 3、重写（Overriding）
        /*
         子类可以通过继承来的实例方法，类方法，实例属性，或下标脚本来实现自己的定制功能，我们把这种行为叫重写（overriding）。
         我们可以使用 override 关键字来实现重写。
         
         重写         访问方法，属性，下标脚本
         方法         super.somemethod()
         属性         super.someProperty()
         下标脚本      super[someIndex]
         */
        
        // 3.1 重写方法
        /*
         在我们的子类中我们可以使用 override 关键字来重写超类的方法。
         以下实例中我们重写了 show() 方法：
        */
        print("3.1 重写方法")
        class SuperClass {
            func show() {
                print("这是超类 SuperClass")
            }
        }

        class SubClass: SuperClass  {
            override func show() {
                print("这是子类 SubClass")
            }
        }

        let superClass = SuperClass()
        superClass.show()

        let subClass = SubClass()
        subClass.show()
        
        
        // 3.2 重写属性
        /*
         你可以提供定制的 getter（或 setter）来重写任意继承来的属性，无论继承来的属性是存储型的还是计算型的属性。
         子类并不知道继承来的属性是存储型的还是计算型的，它只知道继承来的属性会有一个名字和类型。所以你在重写一个属性时，必需将它的名字和类型都写出来。
         注意点：
         【1】如果你在重写属性中提供了 setter，那么你也一定要提供 getter。
         【2】如果你不想在重写版本中的 getter 里修改继承来的属性值，你可以直接通过super.someProperty来返回继承来的值，其中someProperty是你要重写的属性的名字。
         */
        // 以下实例我们定义了超类 Circle 及子类 Rectangle, 在 Rectangle 类中我们重写属性 area：
        print("3.2重写属性")
        class Circle {
            var radius = 12.5
            var area: String {
                return "矩形半径 \(radius) "
            }
        }

        // 继承超类 Circle
        class Rectangle: Circle {
            var show = 7
            override var area: String {
                return super.area + " ，但现在被重写为 \(show)"
            }
        }

        let rect = Rectangle()
        rect.radius = 25.0
        rect.show = 3
        print("Radius \(rect.area)")
        
        
        // 3.3 重写属性观察器
        /*
         你可以在属性重写中为一个继承来的属性添加属性观察器。这样一来，当继承来的属性值发生改变时，你就会监测到。
         注意：你不可以为继承来的常量存储型属性或继承来的只读计算型属性添加属性观察器。
         */
        print("3.3重写属性观察器")
        class Square: Rectangle {
            override var radius: Double {
                didSet {
                    show = Int(radius/5.0)+1
                }
            }
        }
        let sq = Square()
        sq.radius = 100.0
        print("半径: \(sq.area)")
        
        
        // 3.4 防止重写
        /*
         我们可以使用 final 关键字防止它们被重写。
         如果你重写了final方法，属性或下标脚本，在编译时会报错。
         你可以通过在关键字class前添加final特性（final class）来将整个类标记为 final 的，这样的类是不可被继承的，否则会报编译错误
         */
        print("防止重写 : 加上 final ，所有都不可背重写，会直接提示错误")
        final class CircleNew {
            final var radius = 12.5
            var area: String {
                return "矩形半径为 \(radius) "
            }
        }
        
        
        //
    }
    
    func indexScriptLearn() {
        
        // Swift 下标脚本
       /*
         下标脚本 可以定义在类（Class）、结构体（structure）和枚举（enumeration）这些目标中，可以认为是访问对象、集合或序列的快捷方式，不需要再调用实例的特定的赋值和访问方法。
         举例来说，用下标脚本访问一个数组(Array)实例中的元素可以这样写 someArray[index] ，访问字典(Dictionary)实例中的元素可以这样写 someDictionary[key]。
         对于同一个目标可以定义多个下标脚本，通过索引值类型的不同来进行重载，而且索引值的个数可以是多个。
         */
        
        // 1、下标脚本语法及应用
        /*
         语法:
         下标脚本允许你通过在实例后面的方括号中传入一个或者多个的索引值来对实例进行访问和赋值。
         语法类似于实例方法和计算型属性的混合。
         与定义实例方法类似，定义下标脚本使用 subscript 关键字，显式声明入参（一个或多个）和返回类型。
         与实例方法不同的是下标脚本可以设定为读写或只读。这种方式又有点像计算型属性的getter和setter：
         
         subscript(index: Int) -> Int {
            get {
                // 用于下标脚本值的声明
            }
            set(newValue) {
                // 执行赋值操作
            }
         }
         */
        
        
        // 2、实例 1
        print("下标脚本语法及应用")
        struct subexample {
            let decrementer: Int
            subscript(index: Int) -> Int {
                return decrementer / index
            }
        }
        let division = subexample(decrementer: 100)
        print("100 除以 9 等于 \(division[9])")
        print("100 除以 2 等于 \(division[2])")
        print("100 除以 3 等于 \(division[3])")
        print("100 除以 5 等于 \(division[5])")
        print("100 除以 7 等于 \(division[7])")
        /*
         在上例中，通过 subexample 结构体创建了一个除法运算的实例。数值 100 作为结构体构造函数传入参数初始化实例成员 decrementer。
         你可以通过下标脚本来得到结果，比如 division[2] 即为 100 除以 2。
         */
        
        // 3、实例2
        class daysofaweek {
            private var days = ["Sunday", "Monday", "Tuesday", "Wednesday",
                "Thursday", "Friday", "saturday"]
            subscript(index: Int) -> String {
                get {
                    return days[index]   // 声明下标脚本的值
                }
                set(newValue) {
                    self.days[index] = newValue   // 执行赋值操作
                }
            }
        }
        let p = daysofaweek()
        print(p[0])
        print(p[1])
        print(p[2])
        print(p[3])
        
        
        // 4、用法
        /*
         根据使用场景不同下标脚本也具有不同的含义。
         通常下标脚本是用来访问集合（collection），列表（list）或序列（sequence）中元素的快捷方式。
         你可以在你自己特定的类或结构体中自由的实现下标脚本来提供合适的功能。
         例如，Swift 的字典（Dictionary）实现了通过下标脚本对其实例中存放的值进行存取操作。在下标脚本中使用和字典索引相同类型的值，并且把一个字典值类型的值赋值给这个下标脚来为字典设值：
         */
        var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
        numberOfLegs["bird"] = 2
        print(numberOfLegs)
        
        // 5、下标脚本选项
        /*
         下标脚本允许任意数量的入参索引，并且每个入参类型也没有限制。
         下标脚本的返回值也可以是任何类型。
         下标脚本可以使用变量参数和可变参数。
         一个类或结构体可以根据自身需要提供多个下标脚本实现，在定义下标脚本时通过传入参数的类型进行区分，使用下标脚本时会自动匹配合适的下标脚本实现运行，这就是下标脚本的重载。
         */
        print("下标脚本选项")
        struct Matrix {
            let rows: Int, columns: Int
            var showData: [Double]
            init(rows: Int, columns: Int) {
                self.rows = rows
                self.columns = columns
                showData = Array(repeating: 0.0, count: rows * columns)
            }
            subscript(row: Int, column: Int) -> Double {
                get {
                    return showData[(row * columns) + column]
                }
                set {
                    showData[(row * columns) + column] = newValue
                }
            }
        }
        // 创建了一个新的 3 行 3 列的Matrix实例
        var mat = Matrix(rows: 3, columns: 3)

        // 通过下标脚本设置值
        mat[0,0] = 1.0
        mat[0,1] = 2.0
        mat[1,0] = 3.0
        mat[1,1] = 5.0

        // 通过下标脚本获取值
        print("\(mat[0,0])")
        print("\(mat[0,1])")
        print("\(mat[1,0])")
        print("\(mat[1,1])")
        /*
         Matrix 结构体提供了一个两个传入参数的构造方法，两个参数分别是rows和columns，创建了一个足够容纳rows * columns个数的Double类型数组。为了存储，将数组的大小和数组每个元素初始值0.0。
         你可以通过传入合适的row和column的数量来构造一个新的Matrix实例。
         */
    }
    
    func funcTwoLearn() {
        // 方法
        /*
         Swift 方法是与某些特定类型相关联的函数
         在 Objective-C 中，类是唯一能定义方法的类型。但在 Swift 中，你不仅能选择是否要定义一个类/结构体/枚举，还能灵活的在你创建的类型（类/结构体/枚举）上定义方法。
         */
        
        // 1、实例方法
        /*
         在 Swift 语言中，实例方法是属于某个特定类、结构体或者枚举类型实例的方法。
         实例方法提供以下方法：
            【1】可以访问和修改实例属性
            【2】提供与实例目的相关的功能
         实例方法要写在它所属的类型的前后大括号({})之间。
         实例方法能够隐式访问它所属类型的所有的其他实例方法和属性。
         实例方法只能被它所属的类的某个特定实例调用。
         实例方法不能脱离于现存的实例而被调用。
         
         语法：
         func funcname(Parameters) -> returntype
         {
             Statement1
             Statement2
             ……
             Statement N
             return parameters
         }
         */
        
        // 2、实例（类似一个对象的作用）
        class Counter {
            var count = 0
            func increment() {
                count += 1
            }
            func incrementBy(amount: Int) {
                count += amount
            }
            func reset() {
                count = 0
            }
        }
        // 初始计数值是0
        let counter = Counter()

        // 计数值现在是1
        counter.increment()
        // 计数值现在是6
        counter.incrementBy(amount: 5)
        print(counter.count)
        // 计数值现在是0
        counter.reset()
        print(counter.count)
        /*
         Counter类定义了三个实例方法：
         【1】increment 让计数器按 1 递增；
         【2】incrementBy(amount: Int) 让计数器按一个指定的整数值递增；
         【3】reset 将计数器重置为0。
         Counter 这个类还声明了一个可变属性 count，用它来保持对当前计数器值的追踪。
         */
        
        // 3、方法的局部参数名称和外部参数名称
        print("方法的局部参数名称和外部参数名称")
        class division {
            var count: Int = 0
            func incrementBy(no1: Int, no2: Int) {
                count = no1 / no2
                print(count)
            }
        }

        let counter2 = division()
        counter2.incrementBy(no1: 1800, no2: 3)
        counter2.incrementBy(no1: 1600, no2: 5)
        counter2.incrementBy(no1: 11000, no2: 3)
        
        
        // 4、是否提供外部名称设置
        /*
         我们强制在第一个参数添加外部名称把这个局部名称当作外部名称使用（Swift 2.0前是使用 # 号）。
         相反，我们呢也可以使用下划线（_）设置第二个及后续的参数不提供一个外部名称。
         */
        
        class multiplication {
            var count: Int = 0
            func incrementBy(first no1: Int, no2: Int) {
                count = no1 * no2
                print(count)
            }
        }
        let counter3 = multiplication()
        counter3.incrementBy(first: 800, no2: 3)
        counter3.incrementBy(first: 100, no2: 5)
        counter3.incrementBy(first: 15000, no2: 3)
        
        
        // 5、self 属性
        /*
         类型的每一个实例都有一个隐含属性叫做self，self 完全等同于该实例本身。
         你可以在一个实例的实例方法中使用这个隐含的self属性来引用当前实例。
         */
        print("self 属性")
        class calculations {
            let a: Int
            let b: Int
            let res: Int
            
            init(a: Int, b: Int) {
                self.a = a
                self.b = b
                res = a + b
                print("Self 内: \(res)")
            }
            
            func tot(c: Int) -> Int {
                return res - c
            }
            
            func result() {
                print("结果为: \(tot(c: 20))")
                print("结果为: \(tot(c: 50))")
            }
        }

        let pri = calculations(a: 600, b: 300)
        let sum = calculations(a: 1200, b: 300)

        pri.result()
        sum.result()
        
        // 6、在实例方法中修改值类型
        /*
         Swift 语言中结构体和枚举是值类型。一般情况下，值类型的属性不能在它的实例方法中被修改。
         但是，如果你确实需要在某个具体的方法中修改结构体或者枚举的属性，你可以选择变异(mutating)这个方法，然后方法就可以从方法内部改变它的属性；并且它做的任何改变在方法结束时还会保留在原始结构中。
         方法还可以给它隐含的self属性赋值一个全新的实例，这个新实例在方法结束后将替换原来的实例。
         */
        print("在实例方法中修改值类型")
        struct area {
            var length = 1
            var breadth = 1
            
            func area() -> Int {
                return length * breadth
            }
            
            mutating func scaleBy(res: Int) {
                length *= res
                breadth *= res
                print(length)
                print(breadth)
            }
        }

        var val = area(length: 3, breadth: 5)
        val.scaleBy(res: 3)
        val.scaleBy(res: 30)
        val.scaleBy(res: 300)
        
        
        
        // 7、在可变方法中给 self 赋值
        // 可变方法能够赋给隐含属性 self 一个全新的实例。
        print("在可变方法中给 self 赋值")
        struct areaNew {
            var length = 1
            var breadth = 1
            
            func area() -> Int {
                return length * breadth
            }
            
            mutating func scaleBy(res: Int) {
                self.length *= res
                self.breadth *= res
                print(length)
                print(breadth)
            }
        }
        var valNew = area(length: 3, breadth: 5)
        valNew.scaleBy(res: 13)
        
        
        // 8、类型方法
        /*
         实例方法是被类型的某个实例调用的方法，你也可以定义类型本身调用的方法，这种方法就叫做类型方法。
         声明结构体和枚举的类型方法，在方法的func关键字之前加上关键字static。类可能会用关键字class来允许子类重写父类的实现方法。
         类型方法和实例方法一样用点号(.)语法调用。
         */
        print("类型方法")
        class Math {
            class func abs(number: Int) -> Int {
                if number < 0 {
                    return (-number)
                } else {
                    return number
                }
            }
        }

        struct absno {
            static func abs(number: Int) -> Int {
                if number < 0 {
                    return (-number)
                } else {
                    return number
                }
            }
        }

        let no = Math.abs(number: -35)
        let num = absno.abs(number: -5)

        print(no)
        print(num)
    }
    
    func propertyLearn() {
        // 属性
        
        /*
         Swift 属性将值跟特定的类、结构或枚举关联。
         */
        
        // 1、存储属性
        /*
         简单来说，一个存储属性就是存储在特定类或结构体的实例里的一个常量或变量。
         存储属性可以是变量存储属性（用关键字var定义），也可以是常量存储属性（用关键字let定义）。
         【1】可以在定义存储属性的时候指定默认值
         【2】也可以在构造过程中设置或修改存储属性的值，甚至修改常量存储属性的值
         */
        struct Number {
           var digits: Int
           let numbers = 3.1415
        }
        
        var n = Number(digits: 12345)
        n.digits = 67
        
        print("\(n.digits)")
        print("\(n.numbers)")
        
        /*
         代码中 pi 在定义存储属性的时候指定默认值（pi = 3.1415），所以不管你什么时候实例化结构体，它都不会改变。
         如果你定义的是一个常量存储属性，如果尝试修改它就会报错，如下所示：
         */
//        n.numbers = 8.7 // 编译不过：常量不能修改
        
        // 2、延迟存储属性
        /*
         延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。
         在属性声明前使用 lazy 来标示一个延迟存储属性。
         
         注意：
            必须将延迟存储属性声明成变量（使用var关键字），因为属性的值在实例构造完成之前可能无法得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。
         
         延迟存储属性一般用于：
            延迟对象的创建。
            当属性的值依赖于其他未知类
         */
        class sample {
            lazy var no = number() // `var` 关键字是必须的
        }

        class number {
            var name = "Runoob Swift 教程"
        }

        let firstsample = sample()
        print(firstsample.no.name)
        
        
        // 3、实例化变量
        /*
         如果您有过 Objective-C 经验，应该知道Objective-C 为类实例存储值和引用提供两种方法。对于属性来说，也可以使用实例变量作为属性值的后端存储。
         Swift 编程语言中把这些理论统一用属性来实现。Swift 中的属性没有对应的实例变量，属性的后端存储也无法直接访问。这就避免了不同场景下访问方式的困扰，同时也将属性的定义简化成一个语句。
         一个类型中属性的全部信息——包括命名、类型和内存管理特征——都在唯一一个地方（类型定义中）定义。
         */
        
        // 4、计算属性
        /*
         除存储属性外，类、结构体和枚举可以定义计算属性，计算属性不直接存储值，而是提供一个 getter 来获取值，一个可选的 setter 来间接设置其他属性或变量的值。
         */
        print("计算属性")
        class sample2 {
            var no1 = 0.0, no2 = 0.0
            var length = 300.0, breadth = 150.0
            
            var middle: (Double, Double) {
                get{
                    return (length / 2, breadth / 2)
                }
                // 这里的axis 只是代表一个集合
                set(axis){
                    no1 = axis.0 - (length / 2)
                    no2 = axis.1 - (breadth / 2)
                }
            }
        }

        let result = sample2()
        print(result.middle)
        print(result.no1)
        print(result.no2)
        
        result.middle = (0.0, 10.0)
        print(result.no1)
        print(result.no2)
        
        
        // 4、只读计算属性
        /*
            只有 getter 没有 setter 的计算属性就是只读计算属性。
            只读计算属性总是返回一个值，可以通过点(.)运算符访问，但不能设置新的值。
            
            下问的metaInfo就是只读
         */
        print("只读计算属性")
        class film {
            var head = ""
            var duration = 0.0
            var metaInfo: [String:String] {
                return [
                    "head": self.head,
                    "duration":"\(self.duration)"
                ]
            }
        }

        let movie = film()
        movie.head = "Swift 属性"
        movie.duration = 3.09
        print(movie.metaInfo["head"]!)
        print(movie.metaInfo["duration"]!)
        
        // Ps : 必须使用var关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。let关键字只用来声明常量属性，表示初始化后再也无法修改的值。
        
        // 5、属性观察器
        /*
         性观察器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，甚至新的值和现在的值相同的时候也不例外。
         可以为除了延迟存储属性之外的其他存储属性添加属性观察器，也可以通过重载属性的方式为继承的属性（包括存储属性和计算属性）添加属性观察器。
         
         注意：
            不需要为无法重载的计算属性添加属性观察器，因为可以通过 setter 直接监控和响应值的变化。
         
         可以为属性添加如下的一个或全部观察器：
            willSet在设置新的值之前调用
            didSet在新的值被设置之后立即调用
            willSet和didSet观察器在属性初始化过程中不会被调用
         */
        print("属性观察器")
        class Samplepgm {
            var counter: Int = 0{
                willSet(newTotal){
                    print("计数器: \(newTotal)")
                }
                didSet{
                    if counter > oldValue {
                        print("新增数 \(counter - oldValue)")
                    }
                }
            }
        }
        let NewCounter = Samplepgm()
        NewCounter.counter = 100
        NewCounter.counter = 800
        
        // 6、全局变量和局部变量
        
        // 7、类型属性
        /*
         类型属性是作为类型定义的一部分写在类型最外层的花括号（{}）内。
         使用关键字 static 来定义值类型的类型属性，关键字 class 来为类定义类型属性。
         
         struct Structname {
            static var storedTypeProperty = " "
            static var computedTypeProperty: Int {
               // 这里返回一个 Int 值
            }
         }

         enum Enumname {
            static var storedTypeProperty = " "
            static var computedTypeProperty: Int {
               // 这里返回一个 Int 值
            }
         }

         class Classname {
            class var computedTypeProperty: Int {
               // 这里返回一个 Int 值
            }
         }
         
         注意：
            例子中的计算型类型属性是只读的，但也可以定义可读可写的计算型类型属性，跟实例计算属性的语法类似。
         */
        
        
        // 8、获取和设置类型属性的值
        /*
         类似于实例的属性，类型属性的访问也是通过点运算符(.)来进行。但是，类型属性是通过类型本身来获取和设置，而不是通过实例。实例如下：
         */
        struct StudMarks {
           static let markCount = 97
           static var totalCount = 0
           var InternalMarks: Int = 0 {
              didSet {
                 if InternalMarks > StudMarks.markCount {
                    InternalMarks = StudMarks.markCount
                 }
                 if InternalMarks > StudMarks.totalCount {
                    StudMarks.totalCount = InternalMarks
                 }
              }
           }
        }

        var stud1Mark1 = StudMarks()
        var stud1Mark2 = StudMarks()

        stud1Mark1.InternalMarks = 98
        print(stud1Mark1.InternalMarks)

        stud1Mark2.InternalMarks = 87
        print(stud1Mark2.InternalMarks)
    }
    
    func classLearn() {
        // swift 类

        /* 1、类介绍
         Swift 类是构建代码所用的一种通用且灵活的构造体。
         我们可以为类定义属性（常量、变量）和方法。
         与其他编程语言所不同的是，Swift 并不要求你为自定义类去创建独立的接口和实现文件。你所要做的是在一个单一文件中定义一个类，系统会自动生成面向其它代码的外部接口。
         */
        
        /* 2、类和结构体共同点、额外功能
         【1】Swift 中类和结构体有很多共同点。共同处在于：
            定义属性用于存储值
            定义方法用于提供功能
            定义附属脚本用于访问值
            定义构造器用于生成初始化值
            通过扩展以增加默认实现的功能
            符合协议以对某类提供标准功能
         【2】与结构体相比，类还有如下的附加功能：
            继承允许一个类继承另一个类的特征
            类型转换允许在运行时检查和解释一个类实例的类型
            解构器允许一个类实例释放任何其所被分配的资源
            引用计数允许对一个类的多次引用
         */
        
        /* 3、语法:
         class classname {
            Definition 1
            Definition 2
            ……
            Definition N
         }
         */
        
        // 4、基础案例
        // 类定义：（现在版本 swift 需要先初始化）
        class student{
            var studname: String = ""
            var mark: Int = 0
            var mark2: Int = 0
        }
        let studrecord = student()
        
        // 5、案例
        // 5.1 模范结构体
//        class studentMarks {
//            var mark: Int
//            init(mark: Int) {
//                self.mark = mark
//            }
//        }
//        let marks = studentMarks(mark: 500)
//        print("成绩为 \(marks.mark)")
        
        // 5.2 正常类初始化
        class studentMarks {
            var mark = 300
        }
        
        // 6、作为引用类型访问类属性
        let marks = studentMarks()
        print("成绩为 \(marks.mark)")
        
        // 7、恒等运算符
        /*
         因为类是引用类型，有可能有多个常量和变量在后台同时引用某一个类实例。
         为了能够判定两个常量或者变量是否引用同一个类实例，Swift 内建了两个恒等运算符：
         
         恒等运算符                                      不恒等运算符
         运算符为：===                                   运算符为：!==
         如果两个常量或者变量引用同一个类实例则返回 true       如果两个常量或者变量引用不同一个类实例则返回 true
         */
        class SampleClass {
           var mark: String
            init(mark: String) {
                self.mark = mark
            }
        }
        let spClass1 = SampleClass(mark: "Hello")
        let spClass2 = SampleClass(mark: "Hello")
        if spClass1 === spClass2 {// false
            print("引用相同的类实例")
        }
        if spClass1 !== spClass2 {// true
            print("引用不相同的类实例")
        }
    }
    
    func structLearn() {
        // 1、结构体
        /*
         Swift 结构体是构建代码所用的一种通用且灵活的构造体。
         我们可以为结构体定义属性（常量、变量）和添加方法，从而扩展结构体的功能。
         与 C 和 Objective C 不同的是：
         【1】结构体不需要包含实现文件和接口。
         【2】结构体允许我们创建一个单一文件，且系统会自动生成面向其它代码的外部接口。
         结构体总是通过被复制的方式在代码中传递，因此它的值是不可修改的。
         
         语法
         我们通过关键字 struct 来定义结构体：
         struct nameStruct {
            Definition 1
            Definition 2
            ……
            Definition N
         }
         */
        
        // 实例：基本案例
        // 我们定义一个名为 MarkStruct 的结构体 ，结构体的属性为学生三个科目的分数，数据类型为 Int：
//        struct MarkStruct{
//           var mark1: Int
//           var mark2: Int
//           var mark3: Int
//        }
        
        // 我们可以通过结构体名来访问结构体成员。
        // 结构体实例化使用 let 关键字：
        struct studentMarks {
           var mark1 = 100
           var mark2 = 78
           var mark3 = 98
        }
        let marks = studentMarks()
        print("Mark1 是 \(marks.mark1)")
        print("Mark2 是 \(marks.mark2)")
        print("Mark3 是 \(marks.mark3)")
        /*
         实例中，我们通过结构体名 'studentMarks' 访问学生的成绩。结构体成员初始化为mark1, mark2, mark3，数据类型为整型。
         然后我们通过使用 let 关键字将结构体 studentMarks() 实例化并传递给 marks。
         最后我们就通过 . 号来访问结构体成员的值。
         以下实例化通过结构体实例化时传值并克隆一个结构体：
         */
        struct MarksStruct {
           var mark: Int
           init(mark: Int) {
              self.mark = mark
           }
        }
        let aStruct = MarksStruct(mark: 98)
        var bStruct = aStruct // aStruct 和 bStruct 是使用相同值的结构体！
        bStruct.mark = 97
        print(aStruct.mark) // 98
        print(bStruct.mark) // 97
        
        /*
         在你的代码中，你可以使用结构体来定义你的自定义数据类型。
         结构体实例总是通过值传递来定义你的自定义数据类型。
         按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
         结构体的主要目的是用来封装少量相关简单数据值。
         有理由预计一个结构体实例在赋值或传递时，封装的数据将会被拷贝而不是被引用。
         任何在结构体中储存的值类型属性，也将会被拷贝，而不是被引用。
         结构体不需要去继承另一个已存在类型的属性或者行为。
         举例来说，以下情境中适合使用结构体：
         几何形状的大小，封装一个width属性和height属性，两者均为Double类型。
         一定范围内的路径，封装一个start属性和length属性，两者均为Int类型。
         三维坐标系内一点，封装x，y和z属性，三者均为Double类型。
         结构体实例是通过值传递而不是通过引用传递。
         */
        
        struct markStruct{
            var mark1: Int
            var mark2: Int
            var mark3: Int
            
            // 构造函数，初始化时直接设置
            init(mark1: Int, mark2: Int, mark3: Int){
                self.mark1 = mark1
                self.mark2 = mark2
                self.mark3 = mark3
            }
        }
        print("优异成绩:")
        let marks2 = markStruct(mark1: 98, mark2: 96, mark3:100)
        print(marks2.mark1)
        print(marks2.mark2)
        print(marks2.mark3)

        print("糟糕成绩:")
        let fail = markStruct(mark1: 34, mark2: 42, mark3: 13)
        print(fail.mark1)
        print(fail.mark2)
        print(fail.mark3)
        
        /*
         以上实例中我们定义了结构体 markStruct，三个成员属性：mark1, mark2 和 mark3。结构体内使用成员属性使用 self 关键字。
         从实例中我们可以很好的理解到结构体实例是通过值传递的。
         */
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
        
        switch studDetails {
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
        
        
        // 1.10 函数嵌套
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

