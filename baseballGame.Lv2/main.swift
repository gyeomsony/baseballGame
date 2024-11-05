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

// 정답 class
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
// Intput class
class InputHandler {
    
    
}
// 결과 힌트 class
class ResultCalculator {
    
    
}
// 전체관리 클래스
class BaseballGame {
    
    
}
//실행 인스턴스
let game = BaseballGame()



