//
//  RulesVC.swift
//  CardWorkout
//
//  Created by SushantNeupane on 2/5/24.
//

import UIKit

    class RulesVC: UIViewController {
    
        let titleLabel      = UILabel()
        let rulesLabel      = UILabel()
        let exerciseLabel   = UILabel()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
            configureUI()
        }
        
        func configureUI(){
            configureTitleLabel()
            configureRulesLabel()
            configureExerciseLabel()
        }
        
        func configureTitleLabel(){
            view.addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.text = "Rules"
            titleLabel.font = .systemFont(ofSize: 48, weight: .bold)
            titleLabel.textAlignment = .center
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
            ])
        }
        
        func configureRulesLabel(){
            view.addSubview(rulesLabel)
            rulesLabel.translatesAutoresizingMaskIntoConstraints = false
            rulesLabel.font = .systemFont(ofSize: 20, weight: .semibold)
            rulesLabel.text = "The value of each card represents the number of exercise you do.\n\nJ = 11, Q = 12, K = 13, A = 14"
            
            rulesLabel.textAlignment = .center
            rulesLabel.lineBreakMode = .byWordWrapping
            rulesLabel.numberOfLines = 0

            
            NSLayoutConstraint.activate([
                rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
                rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
            
        }
        
        func configureExerciseLabel(){
            view.addSubview(exerciseLabel)
            exerciseLabel.translatesAutoresizingMaskIntoConstraints = false
            exerciseLabel.font = .systemFont(ofSize: 18, weight: .regular)
            
            exerciseLabel.numberOfLines = 0

            
            NSLayoutConstraint.activate([
                exerciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 16),
                exerciseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                exerciseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
            
            var exercise = ""
            exercise.append("♠️ = Push-ups\n")
            exercise.append("❤️ = Sit-up\n")
            exercise.append("♣️ = Burpees\n")
            exercise.append("♦️ = Jumping Jacks\n")
            exerciseLabel.text = exercise
            
        }
    }
