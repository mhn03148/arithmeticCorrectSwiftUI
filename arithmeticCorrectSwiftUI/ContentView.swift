//
//  ContentView.swift
//  arithmeticCorrectSwiftUI
//
//  Created by 주진형 on 2023/06/20.
//

import SwiftUI

struct ContentView: View {
    @State var showMessage: String = ""
    //@State var symbalName: String = ""
    @State var firstNumber: Int = Int.random(in: 0...10)
    @State var secondNumber: Int = Int.random(in: 0...10)
    @State var answerNumber: Int = 0
    @State var presentRound: Int = 0
    @State var flagNumber: Int = Int.random(in: 0...2)
    @State var correctConunt: Int = 0
    @State var incorrectCount: Int = 0
    @State var condition: Int = 0
    @State var colorIndex: Int = 0
    private var backgroundColors = [
        Color.indigo.opacity(0.3),
        Color.green.opacity(0.5),
        Color.red.opacity(0.5)
    ]
    let totalRound: Int = 10
    var body: some View {
        VStack {
            Group{
                Spacer()
                Spacer()
                Text("현재 라운드:\(presentRound) / 총라운드: \(totalRound)")
                Spacer()
                Spacer()
            }.imageScale(.large)
             .foregroundColor(.accentColor)
            Group{
                switch (condition) {
                case 0:
                    Text("게임을 시작 하겠습니다.")
                    Button {
                        answerNumber = returnAnswerNumber(flagNumber, firstNumber, secondNumber)
                        condition = 1
                        presentRound += 1
                    }label: {
                        Text("start!")
                    }.font(.largeTitle).foregroundColor(.mint)
                case 1:
                    Text("\(firstNumber) X \(secondNumber) = \(answerNumber)")
                case 2:
                    Text("게임이 끝났습니다.")
                default:
                    Text("error")
                }
            }.font(.title3)
            Spacer()
            HStack{
                Text("맞춘 횟수: \(correctConunt)")
                Text("틀린 횟수: \(incorrectCount)")
            }
            Spacer()
            HStack{
                Spacer()
                Button {
                    if condition == 1{
                        if presentRound == 11 {
                            presentRound = 10
                            condition = 2
                            colorIndex = 0
                            /*
                            if firstNumber * secondNumber == answerNumber {
                                correctConunt += 1
                                
                            } else if firstNumber * secondNumber != answerNumber {
                                incorrectCount += 1
                            }
                            state = 2
                            
                            return
                             */
                        } else{
                            if firstNumber * secondNumber == answerNumber {
                                correctConunt += 1
                                colorIndex = 1
                            } else if firstNumber * secondNumber != answerNumber {
                                incorrectCount += 1
                                colorIndex = 2
                            }
                            
                            presentRound += 1
                            firstNumber = Int.random(in: 0...10)
                            secondNumber = Int.random(in: 0...10)
                            flagNumber = Int.random(in: 0...2)
                            answerNumber = returnAnswerNumber(flagNumber, firstNumber, secondNumber)
                        }
                    }
                    
                } label: {
                    Image(systemName: "circle.square")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                Button{
                    if presentRound == 11 {
                        presentRound = 10
                        condition = 2
                        colorIndex = 0
                        /*
                        if firstNumber * secondNumber == answerNumber {
                            correctConunt += 1
                        } else if firstNumber * secondNumber != answerNumber {
                            incorrectCount += 1
                        }
                        state = 2
                        
                        return
                         */
                    } else {
                        if condition == 1{
                            if firstNumber * secondNumber == answerNumber {
                                incorrectCount += 1
                                colorIndex = 2
                            } else if firstNumber * secondNumber != answerNumber{
                                correctConunt += 1
                                colorIndex = 1
                            }
                            
                            presentRound += 1
                            firstNumber = Int.random(in: 0...10)
                            secondNumber = Int.random(in: 0...10)
                            flagNumber = Int.random(in: 0...2)
                            answerNumber = returnAnswerNumber(flagNumber, firstNumber, secondNumber)
                        }
                    }
                } label: {
                    Image(systemName: "multiply.square")
                        .imageScale(.large)
                        .foregroundColor(.red)
                }
                Spacer()
            }.font(.largeTitle)
            Group{
                Spacer()
                Spacer()
                Spacer()
                
                Button {
                    presentRound = 0
                    correctConunt = 0
                    incorrectCount = 0
                    condition = 0
                    colorIndex = 0
                } label: {
                    Text("Reset Game")
                }.font(.largeTitle).foregroundColor(.indigo)
            }
            Group{
                Spacer()
                Spacer()
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .background(backgroundColors[colorIndex])
        //.background(backgroundColors1[0])
        .edgesIgnoringSafeArea(.all)
    }
    func returnAnswerNumber (_ plagNumber: Int, _ firstNum: Int, _ secondNum: Int)-> Int{
    var returnNumber: Int = Int.random(in: 0...10)
        switch (plagNumber){
        case 0:
            return returnNumber
        case 1:
            return firstNum * secondNum
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
