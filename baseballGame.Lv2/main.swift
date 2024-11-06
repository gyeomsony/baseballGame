//
//  main.swift
//  baseballGame.Lv2
//
//  Created by 손겸 on 11/5/24.
//

/* 각 클래스별로 기능 나누기
 - 정답 클래스 만들기
 - Input 클래스 만들기
 - 힌트 클래스 만들기 ( 스트라이크와 볼 구분)
 - baseballGame 클래스 만들기 ( 전체적인 관리, 각 클래스의 메서드 호출)
 ---------------------------------------------------------
 
 
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
    func getInput() -> String? {
        print("ㄴ ", terminator: "")
        
        // 공백으로 입력 할 경우
        if let input = readLine() {
            guard !input.isEmpty else {
                print("아무것도 입력되지 않았습니다.")
                return nil
            }
            // 세 자리 이외로 쓸 경우
            guard let number = Int(input), 100...999 ~= number else {
                print("세 자리 숫자로 입력해주세요.")
                return nil
            }
            // 중복된 숫자가 있을 경우
            guard Set(input).count == 3 else {
                print("중복되지 않은 숫자 세 자리를 입력해주세요.")
                return nil
            }
            
            return input
        } else {
            print("숫자를 입력하세요!")
            return nil //readLine이
        }
    }
}

// 힌트 class
class HintCalculator {
    // answer =정답 배열, userGuess= 사용자가 추측한 배열
    func calculateHints(answer: [Int], userGuess: [Int]) -> (strike: Int, ball: Int) {
        
        // 스트라이크 계산
        let strikeCount = zip(answer, userGuess).map { (answerNumber, guessedNumber) in
            return answerNumber == guessedNumber ? 1 : 0 }.reduce(0, +)
        
        // 볼 계산
        let ballCount = userGuess.filter { guessedNumber in
            answer.contains(guessedNumber)
        }.count - strikeCount
        
        return (strikeCount, ballCount)
    }
}


// BaseballGame 클래스
class BaseballGame {
    private let answerGenerator = AnswerGenerator()
    private let inputHandler = InputHandler()
    private let hintCalculator = HintCalculator()
    
    func start() {
        let answer = answerGenerator.generate()
        print("⚾️ 숫자 야구 게임 시작~! 세 자리 숫자를 입력하세요! ⚾️")
        
        while true {
            guard let userInput = inputHandler.getInput() else {
                continue
            }
            //  스트라이크와 볼 값을 가져와 입력값과 비교하여 안내해준다.
            let userGuess = userInput.compactMap { Int(String($0)) }
            let (strike, ball) = hintCalculator.calculateHints(answer: answer, userGuess: userGuess)
            print("스트라이크: \(strike), 볼: \(ball)")
            
            if strike == 3 {
                print("🎉🎉🧢홈⚾️런🧢🎉🎉")
                break
            } else {
                print("아까워요.. 다시!!!")
            }
        }
    }
}
// 실행 인스턴스 생성
let game = BaseballGame()
game.start()
