//
//  main.swift
//  baseballGame
//
//  Created by 손겸 on 11/4/24.
//

import Foundation

class baseballGame {
    func start() {
        // 정답 생성 호출
        let answer = makeAnswer()
    }
}
// 정답 번호 3개 랜덤 생성
func makeAnswer() -> [Int] {
    var numbers:[Int] = []
    while numbers.count < 3{
        var number = Int.random(in: 1...9)
    }
    return numbers
}

let game = baseballGame()
game.start()

