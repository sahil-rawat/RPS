//
//  ViewController.swift
//  RPS
//
//  Created by Sahil Singh Rawat on 21/09/19.
//  Copyright © 2019 Sahil Singh Rawat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissor: UIButton!
    @IBAction func playAgain(_ sender: UIButton) {
        reset()
    }
    @IBAction func ScissorTapped(_ sender: UIButton) {
        play(Sign.Scissors)
    }
    @IBAction func paperTapped(_ sender: UIButton) {
        play(Sign.Paper)
    }
    
    @IBAction func rockTapped(_ sender: Any) {
        play(Sign.Rock)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        reset()
    }
    func play(_ playerSign : Sign){
        rock.isEnabled=false
        scissor.isEnabled=false
        paper.isEnabled=false
        let opponent=randomSighn()
        state.text=opponent.emoji
        let gameResult = playerSign.takeTurn(opponent)
        switch gameResult {
        case .draw:
            textLabel.text="Draw"
        case .win:
            textLabel.text="you won"
        case .lose:
            textLabel.text="you lose"
        case .start:
            textLabel.text="Rock,Paper,Scissors?"
        }
        switch playerSign {
        case .Rock:
            rock.isHidden=false
            scissor.isHidden=true
            paper.isHidden=true
        case .Paper:
            rock.isHidden=true
            scissor.isHidden=true
            paper.isHidden=false
        case .Scissors:
            rock.isHidden=true
            scissor.isHidden=false
            paper.isHidden=true
        }
        playAgain.isHidden=false
    }
    func reset(){
        state.text="🎮"
        textLabel.text="Rock,Paper,Scissors?"
        rock.isHidden=false
        rock.isEnabled=true
        paper.isHidden=false
        paper.isEnabled=true
        scissor.isHidden=false
        scissor.isEnabled=true
        playAgain.isHidden=true
    }


}

