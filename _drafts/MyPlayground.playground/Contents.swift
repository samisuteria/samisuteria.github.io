import UIKit

func lastSeat(n: Int) -> (seat: Int, time: CFTimeInterval){
    let startTime = CACurrentMediaTime()
    var availableSeats = [Int](1...n)
    var index = 0
    
    while availableSeats.count > 1 {
        availableSeats.removeAtIndex(index)
        index++
        if index >= availableSeats.count {
            index = index % availableSeats.count
        }
    }
    let endTime = CACurrentMediaTime()
    return (availableSeats.first!, (endTime - startTime))
}

//for i in [10,100,1000,10000,100000] {
//    i
//    lastSeat(i).time * 1000
//}

lastSeat(100000)
