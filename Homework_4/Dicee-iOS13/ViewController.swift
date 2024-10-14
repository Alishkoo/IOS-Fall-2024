
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelTotalSum: UILabel!
    @IBOutlet weak var imageViewOne: UIImageView!
    @IBOutlet weak var imageViewTwo: UIImageView!
    @IBOutlet weak var imageTest: UIImageView!
    
    var sum = 2 {
        didSet{
            labelTotalSum.text = "The sum is: " + String(sum)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTotalSum.text = "The sum is: " + String(sum)
        
    }
    
    @IBAction func didTapRollDice(_ sender: Any){
        rollTheDice()
    }
    
    func imageForDice(at number: Int) -> UIImage{
        switch number{
        case 1:
            return UIImage(named: "DiceOne")!
        case 2:
            return UIImage(named: "DiceTwo")!
        case 3:
            return UIImage(named: "DiceThree")!
        case 4:
            return UIImage(named: "DiceFour")!
        case 5:
            return UIImage(named: "DiceFive")!
        default:
            return UIImage(named: "DiceSix")!
        }
    }
    
    func rollTheDice(){
        for _ in 1...5{
            var numberOne = Int.random(in: 1...6)
            var numberTwo = Int.random(in: 1...6)
            
            while numberOne == numberTwo {
                    numberTwo = Int.random(in: 1...6)
                }
            
            self.imageViewOne.alpha = 0
            self.imageViewTwo.alpha = 0
            
            UIView.animate(withDuration: 1){
                self.imageViewOne.image = self.imageForDice(at: numberOne)
                self.imageViewOne.alpha = 1.0
            }
            UIView.animate(withDuration: 1){
                self.imageViewTwo.image = self.imageForDice(at: numberTwo)
                self.imageViewTwo.alpha = 1.0
            }
            sum = numberOne + numberTwo
        }
    }


}

