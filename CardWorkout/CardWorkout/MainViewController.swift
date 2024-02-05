//
//  MainViewController.swift
//  CardWorkout
//
//  Created by SushantNeupane on 2/5/24.
//

import UIKit

class MainViewController: UIViewController {

    let cardImageView   = UIImageView()
    let stopButton      = CWButton(backgroundColor: .red, title: "Stop")
    let restartButton   = CWButton(backgroundColor: .green, title: "Restart")
    let rulesButton     = CWButton(backgroundColor:.blue, title: "Rules")
    
    let shapes = ["H", "S", "C", "D"]
    let values = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
    
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    func configureUI(){
        configureCardImageView()
        configureStopButton()
        configureRestartButton()
        configureRulesButton()
    }
    
    func configureCardImageView(){
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        // Programmatic Constraints
        NSLayoutConstraint.activate([
            // Setting width and height
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton(){
        view.addSubview(stopButton)
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stopButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stopButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stopButton.heightAnchor.constraint(equalToConstant: 56),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 8)
        ])
        stopButton.addTarget(self, action: #selector(onStopClick), for: .touchUpInside)
    }
    
    func configureRestartButton(){
        view.addSubview(restartButton)
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            restartButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 8),
            restartButton.heightAnchor.constraint(equalToConstant:56),
            restartButton.widthAnchor.constraint(equalTo: stopButton.widthAnchor, multiplier: 0.48),
            restartButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor)
        ])
        restartButton.addTarget(self, action: #selector(onRestartClick), for: .touchUpInside)
    }
    
    func configureRulesButton(){
        view.addSubview(rulesButton)
        rulesButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 8),
            rulesButton.heightAnchor.constraint(equalToConstant: 56),
            rulesButton.widthAnchor.constraint(equalTo: restartButton.widthAnchor),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor)
        ])
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
    }
    
    @objc func presentRulesVC(){
        present(RulesVC(), animated: true)
        navigationController?.pushViewController(RulesVC(), animated: true)
    }
    
    @objc func onStopClick(){
        if timer.isValid{
            timer.invalidate()
        }
    }
    
    @objc func onRestartClick(){
        if !timer.isValid{
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats:true, block : {_ in
                guard let image = self.generateRandomImage() else {return}
                self.cardImageView.image = image
            })
        }
    }
    
    func generateRandomImage() -> UIImage?{
        guard let shape = shapes.randomElement() else {return nil}
        guard var value = values.randomElement() else {return nil}
        let imageName : String = "\(value)\(shape)"
        return UIImage(named: imageName)
    }
}
