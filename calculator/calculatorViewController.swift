//
//  calculatorViewController.swift
//  calculator
//
//  Created by yousun on 2021/5/5.
//

import UIKit


var currentNumber:Double = 0
var previousNumber:Double = 0

var operationType = ""

var newValue = true


class calculatorViewController: UIViewController {

    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // 輸入數字，用 newValue 判斷輸入的值是幾位數
    @IBAction func numberBtn(_ sender: UIButton) {
        
        let inputNumber = sender.tag
        
        if  newValue == true {
            
            resultLabel.text = "\(inputNumber)"
            newValue = false
        }else{
            
            resultLabel.text! += "\(inputNumber)"
        }
        
        // 如果轉型失敗就帶入 0
        currentNumber = Double(resultLabel.text!) ?? 0
    }
    
    
    // 加
    @IBAction func addBtn(_ sender: UIButton) {
        
        if previousNumber != 0{
            result()
        }
        operationType = "+"
        previousNumber = currentNumber
        newValue = true
    }
    
    
    // 減
    @IBAction func subtractBtn(_ sender: UIButton) {
        
        if previousNumber != 0{

            result()
        }
        operationType = "-"
        previousNumber = currentNumber
        newValue = true
    }
    
    
    // 乘
    @IBAction func multiplyBtn(_ sender: UIButton) {
        
        if previousNumber != 0{
        
            result()
        }
        operationType = "*"
        previousNumber = currentNumber
        newValue = true
    }
    
    
    // 除
    @IBAction func divideBtn(_ sender: UIButton) {
        
        if previousNumber != 0{
            
            result()
        }
        operationType = "/"
        previousNumber = currentNumber
        newValue = true
    }
    
    
    // 等於
    @IBAction func answerBtn(_ sender: UIButton) {
        
        result()
        
        operationType = "="
        previousNumber = currentNumber
        newValue = true
    }
    
    
    // 小數點
    @IBAction func pointBtn(_ sender: Any) {
        if resultLabel.text != nil {
            resultLabel.text! += "."
        }
    }
    
    
    // 清除
    @IBAction func clearBtn(_ sender: UIButton) {
        
        resultLabel.text = "0"
        previousNumber = 0
        currentNumber = 0
        newValue = true
    }
    
    
    // 正負轉換
    @IBAction func negativeBtn(_ sender: Any) {
        
        currentNumber = Double(resultLabel.text!)! * -1
        CheckAnswer(currentNumber)
    }
    
    
    // 百分比
    @IBAction func percentBtn(_ sender: Any) {
        
        currentNumber = Double(resultLabel.text!)! * 0.01
        CheckAnswer(currentNumber)
    }
    
    
    // 用字元判斷運算符號
    func result() {
        switch operationType {
        
            case "+" :
                currentNumber = previousNumber + currentNumber
                CheckAnswer(currentNumber)
                
            case "-":
                currentNumber = previousNumber - currentNumber
                CheckAnswer(currentNumber)
                
            case "*":
                currentNumber = previousNumber * currentNumber
                CheckAnswer(currentNumber)
                
            case "/":
                currentNumber = previousNumber / currentNumber
                CheckAnswer(currentNumber)
                
            case "=":
                currentNumber = previousNumber
                CheckAnswer(currentNumber)
                
            default:
                break
        }
    }
    
    
    // 去掉數字上的小數點 .0
    func CheckAnswer(_ number:Double) {
        var check: String
        
        if floor(number) == number {
            
            check = "\(Int(number))"
        }else{
            
            check = "\(number)"
        }
        
        // 數字超出螢幕範圍，設定顯示最多 9 位數
        if check.count >= 9{
            check = String(check.prefix(9))
        }
        resultLabel.text = check
    }
}
