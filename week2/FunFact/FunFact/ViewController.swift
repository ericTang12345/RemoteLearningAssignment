//
//  ViewController.swift
//  FunFact
//
//  Created by 唐紹桓 on 9/18/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var funFactLabel: UILabel!
    @IBOutlet weak var button: UIButton!

    let funFacts = FuncFacts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFactAndUpdateView()
    }

    @IBAction func showAnotherFunFact(_ sender: UIButton) {
        getFactAndUpdateView()
    }
    
    func getFactAndUpdateView() {
        let (text,color) = funFacts.randomNumberToGetTextAndColor()
        funFactLabel.text = text
        button.setTitleColor(color, for: .normal)
        self.view.backgroundColor = color
    }
}

