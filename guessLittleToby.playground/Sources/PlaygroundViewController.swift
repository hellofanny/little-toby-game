import Foundation
import UIKit
import SpriteKit

public class PlaygroundViewController: UIViewController{
    
    let button: UIButton = UIButton(frame: CGRect(x: 100, y: 20, width: 100, height: 100))
    let square: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.backgroundColor = .gray
        self.view.clipsToBounds = true
        
        
        self.button.setTitle("click", for: .normal)
        self.button.setTitleColor(.blue, for: .normal)
        self.button.backgroundColor = .black
        self.button.addTarget(self, action: #selector(self.pressed), for: .touchUpInside)
        self.view.addSubview(self.button)
        
        
        self.square.center = self.view.center
        self.square.backgroundColor = .green
        self.view.addSubview(self.square)
    }
    
    func pressed(sender: UIButton!){
        self.square.isHidden = !self.square.isHidden
        print("printa aqui")
    }
    
}
