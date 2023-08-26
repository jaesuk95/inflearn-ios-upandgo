//
//  ViewController.swift
//  UpDownGame
//
//  Created by Jaesuk Lee on 2023/08/26.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    // 컴퓨터가 랜덤으로 숫자 선택
    var computerNumber = Int.random(in: 1...10)
    
    // 내가 선택한 숫자
//    var myNumber: Int = 1
    
    
    // 앱의 화면에 들어오면 가장 처음에 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(computerNumber)
        
        // 1. mainLabel 에 "선택하세요" 표시
        mainLabel.text = "선택하세요"
        
        // 2. numberLabel 은 빈 숫자 "" 으로 표시
        numberLabel.text = ""
        
    }


    
    @IBAction func buttonTapped(_ sender: UIButton) {
        // 1. 버튼의 숫자를 가져온다
        guard let numbString = sender.currentTitle else { return } // take out 'optional'
        
        // 2. 숫자 레이블이 변하도록 (숫자에 따라)
        numberLabel.text = numbString
        
        // 3. 선택한 숫자를 변수에다가 저장 (선택 사항) 문자열 -> 숫자로 변환한다음 저장
//        guard let num = Int(numbString) else {return}
//        myNumber = num
        
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        // 변수를 만들지 않고, numberLabel 를 이용해 더 efficient 효율적이다
        // 다만 optional 이여서 옵셔널 벗기기 + 타입 변환 (String -> Int)
        guard let myNumString = numberLabel.text else {return}
        guard let myNumber = Int(myNumString) else {return}
        
        // 1. 컴퓨터의 숫자와 내가 선택한 숫자를 비교 UP 인지 / DOWN / BINGO 인지 (mainLabel)
        if computerNumber > myNumber {
            mainLabel.text = "UP"
        } else if computerNumber < myNumber {
            mainLabel.text = "DOWN"
        } else {
            mainLabel.text = "BINGO 😎"
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1. mainLabel 이 "선택하세요"
        mainLabel.text = "선택하세요"
        
        // 2. numberLabel 레이블을 "" (빈문자열)
        numberLabel.text = ""
        
        // 3. 컴퓨터의 랜덤 숫자를 다시 선택하게
        computerNumber = Int.random(in: 1...10)
        
        print(computerNumber)
        
    }
    
}

