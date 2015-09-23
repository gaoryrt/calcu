//
//  ViewController.swift
//  calcu
//
//  Created by gaoryrt on 15/9/21.
//  Copyright © 2015年 gaoryrt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


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
    
    
    
    
    
    
    var num1:Int = 0
    var num0:Int = 0
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
        
    }
    //以下是进制转换
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
        
        
        
        
    }
    @IBAction func hexAction(sender: AnyObject) {
        //化为16进制
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
        
        
        
        var Dec = Int(resultLabel0.text!)!
        var i = 1
        var Bin = 0
        while(Dec != 0)
        {
            Bin += (Dec%2)*i
            Dec = Dec / 10
            i *= 2
        }
        resultLabel0.text = String(Bin)
    }
    @IBAction func binAction(sender: AnyObject) {
        //化为二进制
        PVNreset(binButton)
        Numreset()
        
        
       
        
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
    }

    @IBAction func cleButton(sender: AnyObject) {
        num0 = 0
        num1 = 0
        opeTemp = ""
        resultLabel0.text = "0"
        inputed = false
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
    }
        
}

