//
//  main.swift
//  baseballGame
//
//  Created by 손겸 on 11/4/24.
//
/* Lv.1
 - 1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다
 - 정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)
 */


import Foundation

class BaseballGame {
    func start() {
        let answer = makeAnswer()
        print("정답은 \(answer) 입니다.")
    }
    func makeAnswer() -> [Int] {
        // 중복 제거를 위한 Set
        var numbers = Set<Int>()
        
        // while문으로 3개 뽑을 때 까지 참으로 돌리고 random 메서드 이용해서 추출
        while numbers.count < 3 {
            let number = Int.random(in: 1...9)
            numbers.insert(number)
        }
        return Array(numbers)
    }
}

// 인스턴스 생성
let game = BaseballGame()
game.start()

// 정답 만드는 기능을 따로 빼보기
// 클래스별로 나눠보기 = 시작하기,기록보기,힌트보기,번호 랜덤생성하기
