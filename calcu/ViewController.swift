//
//  ViewController.swift
//  calcu
//
//  Created by gaoryrt on 15/9/21.
//  Copyright © 2015年 gaoryrt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var out: UILabel!
    @IBOutlet weak var opeLabel: UILabel!
    @IBOutlet weak var resultLabel0: UILabel!
    @IBOutlet weak var hexButton: UIButton!
    @IBOutlet weak var decButton: UIButton!
    @IBOutlet weak var octButton: UIButton!
    @IBOutlet weak var binButton: UIButton!
    @IBOutlet weak var N0B: UIButton!
    @IBOutlet weak var N1B: UIButton!
    @IBOutlet weak var N2B: UIButton!
    @IBOutlet weak var N3B: UIButton!
    @IBOutlet weak var N4B: UIButton!
    @IBOutlet weak var N5B: UIButton!
    @IBOutlet weak var N6B: UIButton!
    @IBOutlet weak var N7B: UIButton!
    @IBOutlet weak var N8B: UIButton!
    @IBOutlet weak var N9B: UIButton!
    @IBOutlet weak var NAB: UIButton!
    @IBOutlet weak var NBB: UIButton!
    @IBOutlet weak var NCB: UIButton!
    @IBOutlet weak var NDB: UIButton!
    @IBOutlet weak var NEB: UIButton!
    @IBOutlet weak var NFB: UIButton!
    
    //方法1: 定义一个变量表示原进制，另一个Int表示目的进制，原进制2，8，10，16进制用数字0，1，2，3表示；目的进制用1，5，9，13表示
    //      进行进制转换调用一转换函数，函数通过原进制和目的进制变量的和得知（4*4-4）中的一种转换   需要写12种转换方式
    //方法2: swift里面吧所有的0x 0o 0b全部以十进制存储
    //      在输入的时候，实时将String转换为Int  专为十进制的时候只用一个方法，转出方法（短除法）也只有一中
    //      需要一个temp放十进制的数，每次进制转换都从temp来转 
    //      可以用resultLabel0直接接短除法的输出的，但是resultLabel0会在用户面前变化，为了避免这种情况发生，需要一个String来记录输出  
    //      用一个变量告诉转入十进制方法原进制，告诉转出方法目的进制
    
    
    
    var temp0:Int = 0
    var scale:Int = 10
    var num1:Int = 0
    var num0:Int = 0
    var temp1:String = ""
    //缓存
    var inputed:Bool = false
    //有数字输入
    var opeTemp:String = ""
    //运算的符号
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel0.text = "0"
        PVNreset(decButton)
        Numreset()
        
        NumbackgroundColorSet(N2B)
        NumbackgroundColorSet(N3B)
        NumbackgroundColorSet(N4B)
        NumbackgroundColorSet(N5B)
        NumbackgroundColorSet(N6B)
        NumbackgroundColorSet(N7B)
        NumbackgroundColorSet(N8B)
        NumbackgroundColorSet(N9B)
        
        
        //将屏幕上的数值初始化
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numButton(sender: AnyObject) {
        if (!inputed)
        {
            num0 = Int(resultLabel0.text!)!
           

            resultLabel0.text = ""}
        else{
            
        }
        resultLabel0.text! +=  sender.currentTitle!!
        inputed = true
        
        temp0 = Int(resultLabel0.text!)!
        out.text = String(temp0)//存储到temp
        
    }
    
    
    
    //以下是进制转换
    func DtoX( numX: Int ){
        var temp = temp0 / numX
        let temp2 = temp0
        var consult = 0
        while(temp != 0){
            consult = temp0 % numX
            switch consult{
            case 10: temp1 = "A" + temp1
            case 11: temp1 = "B" + temp1
            case 12: temp1 = "C" + temp1
            case 13: temp1 = "D" + temp1
            case 14: temp1 = "E" + temp1
            case 15: temp1 = "F" + temp1
            default: temp1 = String(consult) + temp1
            }
            
            temp0 = temp0 / numX
            temp = temp0
        }
        temp0 = temp2
        temp = temp0 / numX
        if(temp == 0){
            consult = temp0 % numX
            temp1 = String(consult) + temp1
        }
        resultLabel0.text = String(temp1)
        
        temp1 = ""
        
    }
    
    
    
    func PVNreset(sender: UIButton){
        //左边四个进制按键的表示
        hexButton.backgroundColor=UIColor.blackColor()
        hexButton.setTitleColor(UIColor.whiteColor(),forState: .Normal)
        octButton.backgroundColor=UIColor.blackColor()
        octButton.setTitleColor(UIColor.whiteColor(),forState: .Normal)
        binButton.backgroundColor=UIColor.blackColor()
        binButton.setTitleColor(UIColor.whiteColor(),forState: .Normal)
        decButton.backgroundColor=UIColor.blackColor()
        decButton.setTitleColor(UIColor.whiteColor(),forState: .Normal)
        hexButton.enabled = true
        octButton.enabled = true
        binButton.enabled = true
        decButton.enabled = true
        sender.backgroundColor = UIColor.whiteColor()
        sender.setTitleColor(UIColor.blackColor(),forState: .Normal)
        sender.enabled = false
        
    }
    func Numreset(){
        
        NumbackgroundColorReset(N2B)
        NumbackgroundColorReset(N3B)
        NumbackgroundColorReset(N4B)
        NumbackgroundColorReset(N5B)
        NumbackgroundColorReset(N6B)
        NumbackgroundColorReset(N7B)
        NumbackgroundColorReset(N8B)
        NumbackgroundColorReset(N9B)
        NumbackgroundColorReset(NAB)
        NumbackgroundColorReset(NBB)
        NumbackgroundColorReset(NCB)
        NumbackgroundColorReset(NDB)
        NumbackgroundColorReset(NEB)
        NumbackgroundColorReset(NFB)
        
        
    }
    
    func NumbackgroundColorSet(sender: UIButton){
        sender.backgroundColor=UIColor.whiteColor()
        sender.setTitleColor(UIColor.blackColor(),forState: .Normal)
        sender.enabled = true
    }
    
    func NumbackgroundColorReset(sender: UIButton){
        sender.backgroundColor=UIColor.blackColor()
        sender.setTitleColor(UIColor.grayColor(),forState: .Normal)
        sender.enabled = false
    }
    
    
    @IBAction func octAction(sender: AnyObject) {
        //化为八进制
        PVNreset(octButton)
        Numreset()
        
        NumbackgroundColorSet(N2B)
        NumbackgroundColorSet(N3B)
        NumbackgroundColorSet(N4B)
        NumbackgroundColorSet(N5B)
        NumbackgroundColorSet(N6B)
        NumbackgroundColorSet(N7B)
        
        DtoX(8)
        
        
        
        
    }
    @IBAction func hexAction(sender: AnyObject) {
        //化为十六进制
        PVNreset(hexButton)
        Numreset()
     
        NumbackgroundColorSet(N2B)
        NumbackgroundColorSet(N3B)
        NumbackgroundColorSet(N4B)
        NumbackgroundColorSet(N5B)
        NumbackgroundColorSet(N6B)
        NumbackgroundColorSet(N7B)
        NumbackgroundColorSet(N8B)
        NumbackgroundColorSet(N9B)
        NumbackgroundColorSet(NAB)
        NumbackgroundColorSet(NBB)
        NumbackgroundColorSet(NCB)
        NumbackgroundColorSet(NDB)
        NumbackgroundColorSet(NEB)
        NumbackgroundColorSet(NFB)
        DtoX(16)
    }
    @IBAction func decAction(sender: AnyObject) {
        // 二进制化十进制
        PVNreset(decButton)
        Numreset()
        
        NumbackgroundColorSet(N2B)
        NumbackgroundColorSet(N3B)
        NumbackgroundColorSet(N4B)
        NumbackgroundColorSet(N5B)
        NumbackgroundColorSet(N6B)
        NumbackgroundColorSet(N7B)
        NumbackgroundColorSet(N8B)
        NumbackgroundColorSet(N9B)
        
        
        
        
    }
    @IBAction func binAction(sender: AnyObject) {
        //化为二进制
        PVNreset(binButton)
        Numreset()
        DtoX(2)
        
        
       
        
    }
    //以上是进制转换
    
    @IBAction func opeButton(sender: AnyObject) {
        if inputed {
            if ((opeTemp == "Mod") || (opeTemp == "*") || (opeTemp == "/") || (opeTemp == "+") || (opeTemp == "-") ){
                num1 = Int(resultLabel0.text!)!
                switch opeTemp{
                case "*": resultLabel0.text = String(num0 * Int(resultLabel0.text!)!)
                case "/": resultLabel0.text = String(num0 / Int(resultLabel0.text!)!)
                case "+": resultLabel0.text = String(num0 + Int(resultLabel0.text!)!)
                case "-": resultLabel0.text = String(num0 - Int(resultLabel0.text!)!)
                case "Mod": resultLabel0.text = String(num0 % Int(resultLabel0.text!)!)
                default : break
                }
                num0 = num1
              
            }
            else{
                num0 = Int(resultLabel0.text!)!
               
            }
            opeTemp = sender.currentTitle!!
            inputed = false
        }
        else{
            opeTemp = sender.currentTitle!!
        }
       opeLabel.text = sender.currentTitle
    
        temp0 = Int(resultLabel0.text!)!
        out.text = String(temp0)//存储到temp
    }

    @IBAction func cleButton(sender: AnyObject) {
        num0 = 0
        num1 = 0
        opeTemp = ""
        resultLabel0.text = "0"
        inputed = false
        
        temp0 = Int(resultLabel0.text!)!
        out.text = String(temp0)//存储到temp
    }
    @IBAction func equButton(sender: AnyObject) {
        if inputed {
            if ((opeTemp == "Mod") || (opeTemp == "*") || (opeTemp == "/") || (opeTemp == "+") || (opeTemp == "-") ){
                num1 = Int(resultLabel0.text!)!
                switch opeTemp{
                case "*": resultLabel0.text = String(num0 * Int(resultLabel0.text!)!)
                case "/": resultLabel0.text = String(num0 / Int(resultLabel0.text!)!)
                case "+": resultLabel0.text = String(num0 + Int(resultLabel0.text!)!)
                case "-": resultLabel0.text = String(num0 - Int(resultLabel0.text!)!)
                case "Mod": resultLabel0.text = String(num0 % Int(resultLabel0.text!)!)
                default : break
                }
                num0 = num1
                
            }
            else{
                num0 = Int(resultLabel0.text!)!
                
            }
           
            inputed = false
        }
        
            opeTemp = ""
        
        opeLabel.text = "="
        
        temp0 = Int(resultLabel0.text!)!
        out.text = String(temp0)//存储到temp
    }
        
}

