//
//  main.swift
//  야구게임
//
//  Created by 조중윤 on 2020/09/15.
//  Copyright © 2020 Jojung-yun. All rights reserved.
//

import Foundation
    
    func randomNumberArrayGenerator() -> [Int] {
        let numberSourceArray = Array(1...9)
        var randomNumberArray = [Int]()
        randomNumberArray.append(numberSourceArray.randomElement()!)
        
        repeat {
            let randomNumber = numberSourceArray.randomElement()!
            if randomNumberArray.contains(randomNumber) == false {
                randomNumberArray.append(randomNumber)
            }
        } while randomNumberArray.count != 3
        
        return randomNumberArray
    }

    func receiveUserAnswer() -> [Int] {
        var userRandomNumberArray = [Int]()
        if let userString:String = readLine() {
            if let userNumber = Int(userString) {
                userRandomNumberArray.append(userNumber/100)
                userRandomNumberArray.append((userNumber%100)/10)
                userRandomNumberArray.append((userNumber)%10)
            }
        }
        return userRandomNumberArray
    }

    func getStrike(randomNumberArray: [Int], userAnswerArray: [Int]) -> Int {
        
        
        var strikeCount:Int = 0
        for i in 0...2 {
            if randomNumberArray[i] == userAnswerArray[i] {
                strikeCount += 1
            }
        }
        return strikeCount
    }

    func getBall(randomNumberArray: [Int], userAnswerArray: [Int]) -> Int {
        var ballCount:Int = 0
        for i in 0...2 {
            if (randomNumberArray[i] != userAnswerArray[i] && randomNumberArray.contains(userAnswerArray[i]))  {
                ballCount += 1
            }
        }
        return ballCount
    }

    func resultShowing(strike:Int, ball:Int) -> String {
        var strikeString:String = ""
        var ballString:String = ""
        
        if (strike > 0) {
            strikeString = "\(strike) 스트라이크"
        }
        
        if (ball > 0) {
            ballString = "\(ball) 볼"
        }
        
        return ("\(strikeString) \(ballString)")
    }

    func gamePlay() {
        let randomNumberArray = randomNumberArrayGenerator()
        var strike:Int
        var ball:Int
        repeat {
            print("숫자를 입력해 주세요 ex)123 : ")
            let userAnswer = receiveUserAnswer()
            
            strike = getStrike(randomNumberArray: randomNumberArray, userAnswerArray: userAnswer)
            ball = getBall(randomNumberArray: randomNumberArray, userAnswerArray: userAnswer)
            
            let result = resultShowing(strike: strike, ball: ball)
            print(result)
            
        } while (strike != 3)
        print ("정답입니다. 축하드립니다.")
    }

gamePlay()
