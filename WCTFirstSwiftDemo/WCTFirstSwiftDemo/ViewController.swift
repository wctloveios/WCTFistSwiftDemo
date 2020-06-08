//
//  ViewController.swift
//  WCTFirstSwiftDemo
//
//  Created by wct on 2020/6/4.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /// <#Description#>
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
        initLearn()
        
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

