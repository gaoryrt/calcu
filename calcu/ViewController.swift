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
    
    @IBOutlet weak var DB: UIButton!
    @IBOutlet weak var TB: UIButton!
    @IBOutlet weak var MB: UIButton!
    @IBOutlet weak var PB: UIButton!
    @IBOutlet weak var ModB: UIButton!
    @IBOutlet weak var EB: UIButton!
    
    @IBOutlet weak var cycLeft: UIButton!
    @IBOutlet weak var cycRight: UIButton!
    @IBOutlet weak var orButton: UIButton!
    @IBOutlet weak var xorButton: UIButton!
    @IBOutlet weak var left: UIButton!
    @IBOutlet weak var right: UIButton!
    @IBOutlet weak var notButton: UIButton!
    @IBOutlet weak var andButton: UIButton!
    
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
    
    var fig:Int = 0
    var Index:String = ""
    var Sub:String = ""
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
        
        NumbackgroundColorSet(DB)
        NumbackgroundColorSet(TB)
        NumbackgroundColorSet(MB)
        NumbackgroundColorSet(PB)
        NumbackgroundColorSet(ModB)
        NumbackgroundColorSet(EB)
        
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
    @IBAction func backspaceAction(sender: AnyObject) {
        if (binButton.enabled == false)
        {
            resultLabel0.text = String(Int(resultLabel0.text!)!/10)
            num1 = temp0 / 2
            
        }
        if (octButton.enabled == false)
        {
            resultLabel0.text = String(Int(resultLabel0.text!)!/10)
            num1 = temp0 / 8
        }
        if (hexButton.enabled == false)
        {
            resultLabel0.text = String(Int(resultLabel0.text!)!/10)
            num1 = temp0 / 16
        }
        if (decButton.enabled == false)
        {
            resultLabel0.text = String(Int(resultLabel0.text!)!/10)
            num1 = temp0 / 10
        }
        
        temp0 = num1
        out.text = String(temp0)
    }
    
    
    @IBAction func numButton(sender: AnyObject) {
        if (!inputed)
        {
            num0 = Int(resultLabel0.text!)!
            resultLabel0.text = ""
        }
        if (hexButton.enabled == false){
            switch sender.currentTitle!! {
            
                case "A": num1 = (num1 * 16) + 10
                case "B": num1 = (num1 * 16) + 11
                case "C": num1 = (num1 * 16) + 12
                case "D": num1 = (num1 * 16) + 13
                case "E": num1 = (num1 * 16) + 14
                case "F": num1 = (num1 * 16) + 15
             default: num1 = (num1 * 16) + Int(sender.currentTitle!!)!
            }
            
        }
        if (decButton.enabled == false){
            num1 = (num1 * 10) + Int(sender.currentTitle!!)!
        }
        if (octButton.enabled == false){
            num1 = (num1 * 8) + Int(sender.currentTitle!!)!
        }
        if (binButton.enabled == false){
            num1 = (num1 * 2) + Int(sender.currentTitle!!)!
            
        }
        
        
        
        
        
        
        temp0 = num1
        resultLabel0.text! += sender.currentTitle!!
        inputed = true
        out.text = String(temp0)//存储到temp
        
    }
    @IBAction func cycR(sender: AnyObject) {
        fig = resultLabel0.text!.lengthOfBytesUsingEncoding(NSUTF16StringEncoding)
        
        Index = (resultLabel0.text! as NSString).substringToIndex((fig-1) / 2)
        resultLabel0.text = "0" + Index
        out.text = BtoD(resultLabel0.text!)
        temp0 = Int(out.text!)!
    }
    @IBAction func cycL(sender: AnyObject) {
        fig = resultLabel0.text!.lengthOfBytesUsingEncoding(NSUTF16StringEncoding)
        Sub = (resultLabel0.text! as NSString).substringFromIndex(1)
        
        resultLabel0.text = Sub + "0"
        out.text = BtoD(resultLabel0.text!)
        temp0 = Int(BtoD(resultLabel0.text!))!
    }
    @IBAction func cycLAction(sender: AnyObject) {
        fig = resultLabel0.text!.lengthOfBytesUsingEncoding(NSUTF16StringEncoding)
        Sub = (resultLabel0.text! as NSString).substringFromIndex(1)
        Index = (resultLabel0.text! as NSString).substringToIndex(1)
        resultLabel0.text = Sub + Index
        out.text = BtoD(resultLabel0.text!)
        temp0 = Int(BtoD(resultLabel0.text!))!
    }
    @IBAction func sysRAction(sender: AnyObject) {
        fig = resultLabel0.text!.lengthOfBytesUsingEncoding(NSUTF16StringEncoding)
        Sub = (resultLabel0.text! as NSString).substringFromIndex((fig-1) / 2)
        Index = (resultLabel0.text! as NSString).substringToIndex((fig-1) / 2)
        resultLabel0.text = Sub + Index
        out.text = BtoD(resultLabel0.text!)
        temp0 = Int(out.text!)!
    }
    func BtoD(string: String) -> String{
        var stringtonumber = Int(string)!
        var output = 0
        var Xtimes = 1
        while ((stringtonumber/10) != 0 ){
            
            output = output + ((stringtonumber % 2) * Xtimes)
            stringtonumber =  stringtonumber / 10
            Xtimes = Xtimes * 2
        }
        output = output + ((stringtonumber % 2) * Xtimes)
        return String(output)
        
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
        hexButton.backgroundColor=UIColor.whiteColor()
        hexButton.setTitleColor(UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1),forState: .Normal)
        octButton.backgroundColor=UIColor.whiteColor()
        octButton.setTitleColor(UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1),forState: .Normal)
        binButton.backgroundColor=UIColor.whiteColor()
        binButton.setTitleColor(UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1),forState: .Normal)
        decButton.backgroundColor=UIColor.whiteColor()
        decButton.setTitleColor(UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1),forState: .Normal)
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
        
        NumbackgroundColorReset(DB)
        NumbackgroundColorReset(TB)
        NumbackgroundColorReset(MB)
        NumbackgroundColorReset(PB)
        NumbackgroundColorReset(ModB)
        NumbackgroundColorReset(EB)
        
        NumbackgroundColorReset(cycLeft)
        NumbackgroundColorReset(cycRight)
        NumbackgroundColorReset(left)
        NumbackgroundColorReset(right)
        NumbackgroundColorReset(orButton)
        NumbackgroundColorReset(xorButton)
        NumbackgroundColorReset(notButton)
        NumbackgroundColorReset(andButton)
        
        
    }
    func NumbackgroundColorSet(sender: UIButton){
        sender.backgroundColor=UIColor.whiteColor()
        sender.setTitleColor(UIColor.blackColor(),forState: .Normal)
        sender.enabled = true
    }
    func NumbackgroundColorReset(sender: UIButton){
        //sender.backgroundColor=UIColor.blackColor()
        sender.setTitleColor(UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1),forState: .Normal)
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
        PVNreset(decButton)
        Numreset()
        
        NumbackgroundColorSet(DB)
        NumbackgroundColorSet(TB)
        NumbackgroundColorSet(MB)
        NumbackgroundColorSet(PB)
        NumbackgroundColorSet(ModB)
        NumbackgroundColorSet(EB)
        
        NumbackgroundColorSet(N2B)
        NumbackgroundColorSet(N3B)
        NumbackgroundColorSet(N4B)
        NumbackgroundColorSet(N5B)
        NumbackgroundColorSet(N6B)
        NumbackgroundColorSet(N7B)
        NumbackgroundColorSet(N8B)
        NumbackgroundColorSet(N9B)
        
        
        
        
        resultLabel0.text = String(temp0)
        
        temp1 = ""
    }
    @IBAction func binAction(sender: AnyObject) {
        //化为二进制
        PVNreset(binButton)
        Numreset()
        DtoX(2)
        
        NumbackgroundColorSet(cycLeft)
        NumbackgroundColorSet(cycRight)
        NumbackgroundColorSet(left)
        NumbackgroundColorSet(right)
        NumbackgroundColorSet(orButton)
        NumbackgroundColorSet(xorButton)
        NumbackgroundColorSet(notButton)
        NumbackgroundColorSet(andButton)
        
       
        
    }
    //以上是进制转换
    
    
    
    
    
    
    @IBAction func opeButton(sender: AnyObject) {
        
        if inputed {
            if ((opeTemp == "Mod") || (opeTemp == "*") || (opeTemp == "/") || (opeTemp == "+") || (opeTemp == "-") ){
//                num1 = Int(resultLabel0.text!)!
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
        fig = 0
        
        temp0 = Int(resultLabel0.text!)!
        out.text = String(temp0)//存储到temp
    }
    @IBAction func equButton(sender: AnyObject) {
        if inputed {
            if ((opeTemp == "Mod") || (opeTemp == "*") || (opeTemp == "/") || (opeTemp == "+") || (opeTemp == "-") ){
                //num1 = Int(resultLabel0.text!)!
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

