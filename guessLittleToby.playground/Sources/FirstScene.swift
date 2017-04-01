
import Foundation
import SpriteKit

public class FirstScene : SKScene{
    
    
    let helloLabel = SKLabelNode(text: "Hi, I'm little Tobby.")
    let littleToby = SKSpriteNode(imageNamed: "littletoby")
    let helloLabel1 = SKLabelNode(text: "What is your name?")
    let textField = UITextField()
   /* let button = SKSpriteNode(color: SKColor.init(red: 221/255, green: 76/255, blue: 100/255, alpha: 1.0), size: CGSize(width: 100, height: 44))
   */
    let button = SKSpriteNode(imageNamed: "btn_hello_normal")
    
    override public func didMove(to view: SKView) {
        
        let frame = CGRect(x: 0, y: 0, width: 550, height: 400)
        
        self.backgroundColor = .white
        
        setPresentationLabels()
        
        littleToby.position = CGPoint(x:self.frame.midX, y:self.frame.midY + 100);
        self.addChild(littleToby)
        
        createTextField()
        createButton()
        
        print(self.helloLabel.frame.width)
        
        
    }
    
    func setPresentationLabels(){
        
        //Hello,I am little toby
        helloLabel.fontColor = SKColor.black
        helloLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        helloLabel.fontSize = 30
        self.addChild(helloLabel)
        
        //what is your name
        helloLabel1.fontColor = SKColor.black
        helloLabel1.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 30)
        helloLabel1.fontSize = 25
        self.addChild(helloLabel1)
        
    }
    
    
    func createTextField(){
        //different orientation UI
        textField.frame = CGRect(x: ((view?.bounds.width)!/2)-100, y: ((view?.bounds.height)!/2)+40, width: self.helloLabel1.frame.width, height: 25)
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.placeholder = "type your name"
        textField.textColor = UIColor.black
        self.view?.addSubview(textField)
    }
    
    
    func createButton(){
        self.button.position = CGPoint(x:self.frame.midX, y:self.frame.midY-100);
        self.addChild(self.button)
    }
    
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        // Check if the location of the touch is within the button's bounds
        if button.contains(touchLocation) {
            
            button.texture = SKTexture(imageNamed: "btn_hello_pressed")
            
            let sceneMoveTo = MainScene(size: self.size)
            sceneMoveTo.scaleMode = self.scaleMode
            sceneMoveTo.personName = (textField.text?.description)!
            self.textField.removeFromSuperview()
    
            let transition = SKTransition.moveIn(with: .right, duration: 0.8)
            self.scene?.view?.presentScene(sceneMoveTo ,transition: transition)

        }
        
    }
    
}

