//
//  main.swift
//  baseballGame.Lv2
//
//  Created by 손겸 on 11/5/24.
//

/*
 - 정답 클래스 만들기
 - Input 클래스 만들기
 - 힌트 클래스 만들기 ( 스트라이크와 볼 구분)
 - baseballGame 클래스 만들기 ( 전체적인 관리, 각 클래스의 메서드 호출)
 
 
 */
import Foundation

// 정답 class - 정답을 랜덤으로 생성
class AnswerGenerator {
    func generate() -> [Int] {
        var numbers = Set<Int>() // 중복 제거를 위한 set 사용
        while numbers.count < 3 {
            let number = Int.random(in: 1...9)
            numbers.insert(number)
        }
        return Array(numbers)
    }
}
// Intput class - 입력값을 받고 3자리가 맞는지 숫자인지 확인한다.
class InputHandler {
    private var overlapInputs: Set<String> = []
    
    func getInput() -> String? { // nil이 아닌 경우 count 확인
        print("입력: ", terminator: "")
        
        if let input = readLine() {
            // 1. 숫자 비워져있는지 확인
            if input.isEmpty {
                print("숫자를 입력해주세요.")
                return nil
            }
            // 3. 숫자로 변환 가능 확인,숫자 세자리인지 확인,숫자 앞에 0이 올 수 없게 확이
            if let number = Int(input) {
                if number < 100 || number > 999 {
                    print("앞자리가 0이 되지 않는 숫자 세 자리를 입력해주세요.")
                    return nil
                }
                // 4. 중복 입력 확인
                if overlapInputs.contains(input) {
                    print("중복된 숫자 입니다. 다시 입력해주세요.")
                    return nil
                } else {
                    // 중복이 아닐 경우 Set에 추가 됨
                    overlapInputs.insert(input)
                }
                
                return input // 모두 만족할 경우 리턴됨
              
            } else {
                print("숫자만 입력하세요..")
                return nil
            }
        } else {
            print("숫!자!를 입력하세요.")
            return nil // readLine 값이 nil인 경우 EOP ??
            
        }
    }
}

// 결과 힌트 class
class HintCalculator {
    
    
}
// 전체관리 클래스
class BaseballGame {
    private let answerGenerator = AnswerGenerator()
    private let inputHandler = InputHandler()
    
    func start() {
        let answer = answerGenerator.generate()
        print("숫자 야구 게임 Strat~!!!!!!! 어서 세 자리 숫자를 입력하세요!")
    }
    
}


//실행 인스턴스
let game = BaseballGame()
let input = InputHandler()
game.start()
input.getInput()


