
import Foundation
import SpriteKit

public class MyScene : SKScene{
    
    let textField = UITextField()
    let button = SKSpriteNode(color: SKColor.brown, size: CGSize(width: 100, height: 44))
    let helloLabel = SKLabelNode(text: "Hello")
    let helloLabel2 = SKLabelNode(text: "I am little Tobby.")
    let helloLabel3 = SKLabelNode(text: "What is your name?")
    
    
    let buttonLabel = SKLabelNode (text: "OK!")
    
    
   // public var frameV = CGRect()
    
    var midPoint = CGPoint()

    
    override public func didMove(to view: SKView) {
        
        let frame = CGRect(x: 0, y: 0, width: 550, height: 400)
        
        midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)
        
        self.backgroundColor = .white
        
        helloLabel.fontColor = SKColor.black
        helloLabel.position = CGPoint(x: self.frame.midX, y: self.frame.maxY - 140)
        helloLabel.fontSize = 60
        self.addChild(helloLabel)
        
        createButton()
        createTextField()
        setPresentationLabels()
        
      //  textField.addTarget(self, action: #selector(MyScene.tapTextField), for: UIControlEvents.touchDown)
        
        
    }
    
    func setPresentationLabels(){
        helloLabel2.fontColor = SKColor.black
       // helloLabel2.position = CGPoint(x:self.frame.midX, y: self.helloLabel.frame.size.height - 100)
        helloLabel2.position = CGPoint(x: self.frame.midX, y: self.frame.maxY - 180)
        helloLabel2.fontSize = 30
        self.addChild(helloLabel2)
        
        
    }
    
    func createTextField(){
        textField.frame = CGRect(x: ((view?.bounds.width)!/2)-50, y: (view?.bounds.height)!/2, width: 250, height: 40)
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.placeholder = "type your name"
        textField.textColor = UIColor.black
        textField.font = UIFont(name: "helvetica", size: 16)
        self.view?.addSubview(textField)
    }
    
    func createButton()
    {
     
        
        // Put it in the center of the scene
        
        self.button.position = CGPoint(x:self.frame.midX, y:self.frame.midY-100);
        
        self.addChild(self.button)
        
    }
    
   /* func tapTextField(textField: UITextField) {
        textField.text = "got it!"
    }
    */
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        // Check if the location of the touch is within the button's bounds
        if button.contains(touchLocation) {
            
            
            let sceneMoveTo = Second(size: self.size)
            
            sceneMoveTo.scaleMode = self.scaleMode
            
            sceneMoveTo.nomePessoa = (textField.text?.description)!
            self.textField.removeFromSuperview()
            
            let transition = SKTransition.moveIn(with: .right, duration: 0.8)
            self.scene?.view?.presentScene(sceneMoveTo ,transition: transition)
           
           
             //print("tapped!")
            
        
        }
        
    }
    
}

