//
//  ViewController.swift
//  TimerTest
//
//  Created by yujung on 2022/09/30.
//

import UIKit

class ViewController: UIViewController {
  let stopWatch = Stopwatch()
  
  lazy var label: UILabel = {
    let v = UILabel()
    v.backgroundColor = .darkGray
    v.textColor = .white
    v.text = "60"
    return v
  }()
  
  lazy var startButton: UIButton = {
    let v = UIButton()
    v.backgroundColor = .green
    v.tintColor = .white
    v.setTitle("시작!", for: .normal)
    v.addTarget(self, action: #selector(pressedStartButton), for: .touchUpInside)
    return v
  }()
  
  lazy var button: UIButton = {
    let v = UIButton()
    v.backgroundColor = .blue
    v.tintColor = .white
    v.setTitle("멈추!", for: .normal)
    v.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
    return v
  }()
  
  lazy var stackView: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [label, startButton, button])
    stack.spacing = 20
    stack.axis = .vertical
    stack.distribution = .fillEqually
    stack.alignment = .fill
    return stack
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUp()
  }
  
  @objc private func pressedStartButton() {
    stopWatch.start()
    label.text = "60"
  }
  
  @objc private func pressedButton() {
    label.text = "\(stopWatch.elapsedTime())"
    //stopWatch.stop()
  }

  private func setUp() {
    view.addSubview(stackView)
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
    ])
    
    
  }

}

