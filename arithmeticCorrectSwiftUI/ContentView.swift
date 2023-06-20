//
//  ContentView.swift
//  arithmeticCorrectSwiftUI
//
//  Created by 주진형 on 2023/06/20.
//

import SwiftUI

struct ContentView: View {
    @State var showMessage: String = ""
    @State var symbalName: String = ""
    @State var firstNumber: Int = Int.random(in: 0...10)
    @State var secondNumber: Int = Int.random(in: 0...10)
    @State var answerNumber: Int = 0
    @State var presentRound: Int = 0
    @State var flagNumber: Int = Int.random(in: 0...2)
    @State var correctConunt: Int = 0
    @State var incorrectCount: Int = 0
    @State var startBool: Bool = false
    
    let totalRound: Int = 10
    var body: some View {
        VStack {
            Group{
                Text("현재 라운드:\(presentRound) / 총라운드: \(totalRound)")
                Spacer()
                Spacer()
            }.imageScale(.large).foregroundColor(.accentColor)
            
            if startBool == false {
                Text("게임을 시작 하겠습니다.")
                Button {
                    startBool = true
                    answerNumber = returnAnswerNumber(flagNumber, firstNumber, secondNumber)
                }label: {
                    Text("start!")
                }
            }else {
                if presentRound < 11 {
                    Text("\(firstNumber) X \(secondNumber) = \(answerNumber)")
                }else {
                    Text("게임이 끝났습니다!")
                    
                }
            }
            
            Spacer()
            HStack{
                Text("맞춘 횟수: \(correctConunt)")
                Text("틀린 횟수: \(incorrectCount)")
            }
            Spacer()
            HStack{
                Spacer()
                Button {
                    if firstNumber * secondNumber == answerNumber && presentRound < 10{
                    correctConunt += 1
                    } else{
                        incorrectCount += 1
                    }
                    if presentRound < 10 {
                        presentRound += 1
                        firstNumber = Int.random(in: 0...10)
                        secondNumber = Int.random(in: 0...10)
                        flagNumber = Int.random(in: 0...2)
                        answerNumber = returnAnswerNumber(flagNumber, firstNumber, secondNumber)
                    }
                    
                } label: {
                    Image(systemName: "circle.square")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                }
                
                Spacer()
                
                Button{
                    if firstNumber * secondNumber == answerNumber && presentRound < 10{
                        incorrectCount += 1
                    } else{
                        correctConunt += 1
                    }
                    if presentRound < 10 {
                        presentRound += 1
                        firstNumber = Int.random(in: 0...10)
                        secondNumber = Int.random(in: 0...10)
                        flagNumber = Int.random(in: 0...2)
                    }
                    
                } label: {
                    Image(systemName: "multiply.square")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                }
                Spacer()
            }.font(.largeTitle)
            Group{
                Spacer()
                Spacer()
                Spacer()
                
                Button {
                    presentRound = 0
                    startBool = false
                    correctConunt = 0
                    incorrectCount = 0
                } label: {
                    Text("reset")
                }.font(.largeTitle)
            }
            Group{
                Spacer()
                Spacer()
                Spacer()
            }
        }
        .padding()
    }
    func returnAnswerNumber (_ plagNumber: Int, _ firstNum: Int, _ secondNum: Int)-> Int{
    var returnNumber: Int = Int.random(in: 0...10)
        switch (plagNumber){
        case 0:
            return returnNumber
        case 1:
            return returnNumber
        case 2:
            return firstNum * secondNum
        default:
            return 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
