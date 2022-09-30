//
//  Stopwatch.swift
//  TimerTest
//
//  Created by yujung on 2022/09/30.
//

import Foundation

class Stopwatch {
  private var startTime: Date?
  private var accumulatedTime: TimeInterval = 0
  
  func start() {
    self.startTime = Date()
  }
  
  func stop() {
    self.accumulatedTime = self.elapsedTime()
    self.startTime = nil
  }
  
  func reset() {
    self.accumulatedTime = 0
    self.startTime = nil
  }
  
  func elapsedTime() -> TimeInterval {
    return -(self.startTime?.timeIntervalSinceNow ?? 0) + self.accumulatedTime
  }
}
