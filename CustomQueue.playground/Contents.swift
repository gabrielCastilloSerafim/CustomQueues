import Foundation

typealias mockCompletion = () -> Void

let myCustomQueue = DispatchQueue(label: "myCustomQueue", qos: .background)
let semaphore = DispatchSemaphore(value: 0)


myCustomQueue.async {
    
    performMockAPICall {
        print("Received first API call")
        semaphore.signal()
    }
    semaphore.wait()
    
    performMockAPICall {
        print("Received second API call")
        semaphore.signal()
    }
    semaphore.wait()
    
    performMockAPICall {
        print("Received third API call")
        semaphore.signal()
    }
    semaphore.wait()
    
}

func performMockAPICall(completion: @escaping mockCompletion) {
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        completion()
    }
}
