import UIKit

func fizzbuzz(){
    for i in 1...100{
        
        if i % 3 == 0 && i % 5 == 0{
            print("FIZZBUZZ")
            continue;
        }
        
        if i % 3 == 0 {
            print("FIZZ")
            continue
        }
        
        if i % 5 == 0 {
            print("BUZZ")
            continue
        }
        
        print(i)
    }
}

fizzbuzz()
