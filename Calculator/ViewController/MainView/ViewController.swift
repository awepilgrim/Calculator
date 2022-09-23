//
//  ViewController.swift
//  Calculator
//
//  Created by Олег Семёнов on 09.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Views
    private let display = UITextField()
    private var displayView = UIView()
    private let mainVStack = UIStackView()
    
    // MARK: Properties
    var service: CalcService?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        service = CalcService(displayView: self)
        view.backgroundColor = .systemGray2
        
        configureAppearance()
    }
    
    // MARK: ViewController's methods
    func updateDisplay(text: String) {
        DispatchQueue.main.async {
            self.display.text = text
        }
    }
    @objc func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0...9:
            service?.numberAction(number: sender.tag)
        case 10:
            service?.dot()
        case 11:
            service?.makeResult()
        case 12:
            service?.addition()
        case 13:
            service?.substruction()
        case 14:
            service?.multiplication()
        case 15:
            service?.acAction()
        case 16:
            service?.changeSign()
        case 17:
            service?.percent()
        case 18:
            service?.division()
        default:
            break
        }
    }
}

// MARK: ViewController's private methods
private extension ViewController {
    func configureAppearance() {
        setupDisplayView()
        setupButtons()
        setupMainVStack()
    }
    func setupMainVStack() {
        mainVStack.axis = .vertical
        mainVStack.frame = CGRect(x: 0, y: 60, width: Constants.screenWidth, height: Constants.screenHeight - 60)
        
        self.view.addSubview(mainVStack)
    }
    func setupDisplayView() {
        displayView.frame = CGRect(x: 0, y: 0, width: Constants.screenWidth, height: Constants.screenHeight - (82 * 5) - 60 - 30)
        
        display.frame = CGRect(x: 15, y: 15, width: displayView.frame.width - 30, height: displayView.frame.height - 15)
        display.textAlignment = .right
        display.contentVerticalAlignment = .bottom
        display.text = "0"
        display.textColor = .white
        display.font = UIFont.boldSystemFont(ofSize: 80)
        
        displayView.addSubview(display)
        mainVStack.addSubview(displayView)
    }
  
    func setupLine1() {
        let line1 = createHStack(yPosition: Int(displayView.frame.height) + 0)
        
        let acButton = createButton(order: 0, title: "AC", tag: 15)
        acButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        acButton.backgroundColor = .blue
        let signButton = createButton(order: 1, title: "+/-", tag: 16)
        signButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        signButton.backgroundColor = .blue
        let percentButton = createButton(order: 2, title: "%", tag: 17)
        percentButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        percentButton.backgroundColor = .blue
        let divisionButton = createButton(order: 3, title: "/", tag: 18)
        divisionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        divisionButton.backgroundColor = .brown

        line1.addSubview(acButton)
        line1.addSubview(signButton)
        line1.addSubview(percentButton)
        line1.addSubview(divisionButton)
        mainVStack.addSubview(line1)
    }
    func setupLine2() {
        let line2 = createHStack(yPosition: Int(displayView.frame.height) + 80 + 2)
        
        let sevenButton = createButton(order: 0, title: "7", tag: 7)
        sevenButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let eightButton = createButton(order: 1, title: "8", tag: 8)
        eightButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let nineButton = createButton(order: 2, title: "9", tag: 9)
        nineButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let multiplicationButton = createButton(order: 3, title: "*", tag: 14)
        multiplicationButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        multiplicationButton.backgroundColor = .brown
        
        line2.addSubview(sevenButton)
        line2.addSubview(eightButton)
        line2.addSubview(nineButton)
        line2.addSubview(multiplicationButton)
        mainVStack.addSubview(line2)
    }
    
    func setupLine3() {
        let line3 = createHStack(yPosition: Int(displayView.frame.height) + 80 + 80 + 2 + 2)
        
        let fourButton = createButton(order: 0, title: "4", tag: 4)
        fourButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let fiveButton = createButton(order: 1, title: "5", tag: 5)
        fiveButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let sixButton = createButton(order: 2, title: "6", tag: 6)
        sixButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let substructionButton = createButton(order: 3, title: "-", tag: 13)
        substructionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        substructionButton.backgroundColor = .brown
        
        line3.addSubview(fourButton)
        line3.addSubview(fiveButton)
        line3.addSubview(sixButton)
        line3.addSubview(substructionButton)
        mainVStack.addSubview(line3)
    }
    func setupLine4() {
        let line4 = createHStack(yPosition: Int(displayView.frame.height) + 80 + 80 + 80 + 2 + 2 + 2)
        
        let oneButton = createButton(order: 0, title: "1", tag: 1)
        oneButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let twoButton = createButton(order: 1, title: "2", tag: 2)
        twoButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let threeButton = createButton(order: 2, title: "3", tag: 3)
        threeButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let additionButton = createButton(order: 3, title: "+", tag: 12)
        additionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        additionButton.backgroundColor = .brown
        
        line4.addSubview(oneButton)
        line4.addSubview(twoButton)
        line4.addSubview(threeButton)
        line4.addSubview(additionButton)
        
        mainVStack.addSubview(line4)
    }
    func setupLine5() {
        let line5 = createHStack(yPosition: Int(displayView.frame.height) + 80 + 80 + 80 + 80 + 2 + 2 + 2 + 2)
        
        let zeroButton = createButton(order: 0, title: "0", tag: 0)
        zeroButton.frame = CGRect(x: 2, y: 0, width: Int(Constants.screenWidth / 4) * 2 - 2, height: 80)
        zeroButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let commaButton = createButton(order: 2, title: ",", tag: 10)
        commaButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        let equalButton = createButton(order: 3, title: "=", tag: 11)
        equalButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        equalButton.backgroundColor = .brown
        
        line5.addSubview(zeroButton)
        line5.addSubview(commaButton)
        line5.addSubview(equalButton)
        mainVStack.addSubview(line5)
    }
    
    func setupButtons() {
        setupLine1()
        setupLine2()
        setupLine3()
        setupLine4()
        setupLine5()
    }
    
    func createButton(order: Int, title: String, tag: Int) -> UIButton {
        let button = UIButton(frame: CGRect(x: Int(Constants.screenWidth / 4) * order + 2, y: 0, width: Int(Constants.screenWidth / 4 - 2), height: 80))
        
        button.setTitle(title, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.tag = tag
        
        return button
    }
    func createHStack(yPosition: Int) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.frame = CGRect(x: 0, y: yPosition, width: Int(Constants.screenWidth), height: 80)
        
        return stack
    }
}

