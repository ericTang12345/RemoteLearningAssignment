//
//  FunFacts.swift
//  FunFact
//
//  Created by 唐紹桓 on 9/18/20.
//

import UIKit

class FuncFacts {
    let texts = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus",
        "Contrary to popular belief, Lorem Ipsum is not simply random text.",
        "Richard McClintock, a Latin professor at Hampden-Sydney College in ",
        "looked up one of the more obscure Latin words, consectetur",
        "from a Lorem Ipsum passage, and going through the cites of the word",
        "This book is a treatise on the theory of ethics, very popular during the.",
        "The first line of Lorm Ipsum, Lorem ipsum dolor sit amet..."
    ]
    
    let colors: [UIColor] = [.systemRed,.orange,#colorLiteral(red: 1, green: 0.7941015363, blue: 0.472238481, alpha: 1),.systemGreen,.blue,#colorLiteral(red: 0.4352941176, green: 0.7294117647, blue: 0.7215686275, alpha: 1),.purple]
    
    func randomNumberToGetTextAndColor() -> (String,UIColor) {
        let randomNumber = Int.random(in: 0...6)
        return (texts[randomNumber],colors[randomNumber])
    }
}
