//
//  ViewController.swift
//  Lesson-7-Closure
//
//  Created by Aleksandr Moroshovskyi on 11.03.2024.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doSomething()
        
        print("..... ..... ..... ..... .....")
        
        printClosure()
        
        print("..... ..... ..... ..... .....")
        
        closureWithInputParameters(20)
        
        print("..... ..... ..... ..... .....")
        
        let randomResult = closureWithReturnValue()
        print("Random is \(randomResult)")
        
        print("..... ..... ..... ..... .....")
        
        doAnotherLogic(completion: printClosure)
        
        print("..... ..... ..... ..... .....")
        
        doAnotherLogic {
            print("CodeBlock -> doAnotherLogic")
        }
        
        print("..... ..... ..... ..... .....")
        
        doAnotherLogic {
            
            DispatchQueue.main.asyncAfter(deadline:  .now() + 5) {
                print("Print after 5 sec")
            }
            
        }
        
        print("..... ..... ..... ..... .....")
        
        var someResult = "no data"
        print(someResult)
        
        doAnotherLogic {
            
            DispatchQueue.main.asyncAfter(deadline:  .now() + 5) {
                print("main.asyncAfter before is: \(someResult)")
                print("Print after 5 sec")
                someResult = "New data + Print after 5 sec"
                print("main.asyncAfter after callback and change: \(someResult)")
            }
            
        }
        
        someResult = "waiting for data"
        print("some \(someResult)")
        
    }
    
    func doSomething() {
        
        func doLogic() {
            print("doLogic")
            //_replDebugPrintln("doLogic")
        }
        
        doLogic()
        print("did something")
    }
    
    //Closure
    
    let printClosure: () -> () = {
        print("printClosure")
    }
    
    // printClosure()
    
    let closureWithInputParameters: (Int) -> () = { intValue in
        print("closureWithInputParameters \(intValue)")
    }
    
    //closureWithInputParameters(20)
    
    let closureWithReturnValue: () -> (Int) = {
        return Int.random(in: 0...100)
    }
    
    //let randomResult = closureWithReturnValue()
    //print("Random is \(randomResult)")
    
    func doAnotherLogic(completion: () -> ()) {
        print("start doAnotherLogic")
        completion()
        print("finish doAnotherLogic")
    }
    
    //doAnotherLogic(completion: printClosure)
    
}

