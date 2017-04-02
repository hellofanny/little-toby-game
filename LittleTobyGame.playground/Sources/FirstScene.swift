
import Foundation
import SpriteKit

public class FirstScene : SKScene{
    
    
    let helloLabel = SKLabelNode(text: "Hi, I'm little Toby.")
    let littleToby = SKSpriteNode(imageNamed: "littletoby")
    let helloLabel1 = SKLabelNode(text: "What is your name?")
    let textField = UITextField()
   
    let button = SKSpriteNode(imageNamed: "btn_hello_normal")
    
    
    
    
    override public func didMove(to view: SKView) {
        
        let frame = CGRect(x: 0, y: 0, width: 550, height: 400)
        
        self.backgroundColor = .white
        
        self.setPresentationLabels()
        
        self.littleToby.position = CGPoint(x:self.frame.midX, y:self.frame.midY + 100);
        self.addChild(littleToby)
        
        self.createTextField()
        self.createButton()
    }
    
    
    func setPresentationLabels(){
        
        //Hello,I am little toby
        self.helloLabel.fontColor = SKColor.black
        self.helloLabel.fontName = ".SFUIText"
        self.helloLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.helloLabel.fontSize = 30
        self.addChild(helloLabel)
        
        //what is your name
        self.helloLabel1.fontColor = SKColor.black
        self.helloLabel1.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 30)
        self.helloLabel1.fontSize = 25
        self.addChild(helloLabel1)
        
    }
    
    
    func createTextField(){
        //different orientation UI
        self.textField.frame = CGRect(x: ((view?.bounds.width)!/2)-100, y: ((view?.bounds.height)!/2)+40, width: self.helloLabel1.frame.width, height: 25)
        self.textField.borderStyle = UITextBorderStyle.roundedRect
        self.textField.placeholder = "type your name"
        self.textField.textColor = UIColor.black
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
        if self.button.contains(touchLocation) {
            
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

