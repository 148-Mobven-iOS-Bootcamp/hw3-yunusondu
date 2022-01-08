//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Semih Emre ÜNLÜ on 26.12.2021.
//

import Foundation




func multiply(op1: Double, op2: Double) -> Double {
    return op1 * op2
}
func add(op1: Double, op2: Double) -> Double {
    return op1 + op2
}
func subtract(op1: Double, op2: Double) -> Double {
    return op1 - op2
}
func divide(op1: Double, op2: Double) -> Double {
    return op1 / op2
}

class CalculatorBrain {
    //istenen işlemler + - * / bonus C CE =
    //standford university ios 9 > youtube video 1 ya da 2
    private var accumulator : Double = 0
    
    func setOperand( operand: Double) {
        accumulator = operand
    }
    
    var operations: Dictionary<String,Operation> = [
        "√" : Operation.UnaryOperation(sqrt),
        "✕" : Operation.BinaryOperation(multiply),
        "+" : Operation.BinaryOperation(add),
        "-" : Operation.BinaryOperation(subtract),
        "/" : Operation.BinaryOperation(divide),
        "=" : Operation.Equals,
        "CE" : Operation.EditNum,
        "C" : Operation.Clean
        ]

   
    enum Operation {
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
        case Clean
        case EditNum
    }

    func performOperation( symbol : String) {
       if let operation = operations[symbol] {
            switch operation {
            case .BinaryOperation(let function): pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .UnaryOperation(let function):
                            accumulator = function(accumulator)
                
            case .Equals:
                if pending != nil {
                    accumulator = pending!.binaryFunction(pending!.firstOperand,accumulator)
                    pending = nil
                }
            case .Clean:accumulator = 0
                
            case .EditNum: accumulator = 0
            }
        
        }
    }
  
       
   
    
    private var pending: PendingBinaryOperationInfo?
        
    struct PendingBinaryOperationInfo {
        var binaryFunction : (Double, Double) -> Double
        var firstOperand: Double
    }

    var result: Double {
        get {
            return accumulator
        }
    }

    
}


