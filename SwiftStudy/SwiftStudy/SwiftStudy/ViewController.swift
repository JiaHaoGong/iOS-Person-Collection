//
//  ViewController.swift
//  SwiftStudy
//
//  Created by ylgwhyh on 16/3/28.
//  Copyright © 2016年 com.ylgwhyh.SwiftStudy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Hello World！")
        
        //简单值
        var myVariable = 12
        myVariable = 30
        let myConstant = 13
        print("简单值:",myVariable,myVariable,myConstant)
        //
        let implicitInteger = 70
        let implicDouble = 70.0
        let explicitDouble:Double = 70
        print(implicitInteger,implicDouble,explicitDouble)
        
        let explicitFloat:Float = 50.0;
        print("显示指定类型为Float，并指定初始值为4",explicitFloat)
        
        let label = "The width is"
        let width = 94
        let widthLabel  = label + String(width) //字符串和数值合并为一个字符串
        print("widthLabel=",widthLabel)

        /// 浮点级数转字符串
        let apples = 3
        let oranges = 5
        let appleSummary = "I have \(apples) apple."
        let fruitSummary = "I have \(apples + oranges) pieces of fruit"
        
        print("appleSummary+fruitSummary=",appleSummary,fruitSummary)
        //appleSummary+fruitSummary= I have 3 apple. I have 8 pieces of fruit
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

