//
//  CountdownTimer.swift
//  SpeedyWords
//
//  Created by Roberto on 2023-03-30.
//

import Foundation

class CountdownTimer {
    private let queue: DispatchQueue
    private let timer: DispatchSourceTimer
    private var remainingTime: TimeInterval
    private let initTime: TimeInterval
    
    init(interval: TimeInterval, queue: DispatchQueue = DispatchQueue.global(), tickHandler: @escaping (TimeInterval) -> Void, completionHandler: (() -> Void)? = nil) {
        self.queue = queue
        self.timer = DispatchSource.makeTimerSource(queue: queue)
        self.remainingTime = interval
        self.initTime = interval
        
        self.timer.schedule(deadline: .now() + 1, repeating: 1)
        self.timer.setEventHandler {
            self.remainingTime -= 1
            if self.remainingTime <= 0 {
                self.timer.cancel()
                completionHandler?()
            } else {
                tickHandler(self.remainingTime)
            }
        }
    }
    
    func start() {
        self.timer.resume()
    }
    
    func cancel() {
        self.timer.cancel()
    }
    
    func reset() {
        self.remainingTime = self.initTime
    }
    
    deinit {
        self.timer.cancel()
    }
}
