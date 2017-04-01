import Foundation
import SpriteKit

public class LastScene : SKScene{
    
    
    let labelPersonName = SKLabelNode()
    let sentenceLabel = SKLabelNode(text: "uhull! Congratulations!!")
    let sentenceLabel1 = SKLabelNode(text: "You've collected many cute stickers.")
    let littleToby = SKSpriteNode(imageNamed: "proudOfYou")
    let button = SKSpriteNode(imageNamed: "btn_playAgain_normal")
    
    var personName = String()
    
    
    
    override public func didMove(to view: SKView) {
        
        let frame = CGRect(x: 0, y: 0, width: 550, height: 400)
        
        self.backgroundColor = .white
        
        setPersonName()
        setPresentationLabels()
        
        littleToby.position = CGPoint(x:self.frame.midX, y:self.button.position.y+165);
        littleToby.setScale(0.45)
        self.addChild(littleToby)
        
        createButton()
        
    }
    
    
    func setPersonName(){
        
        //testing
        labelPersonName.text = "Fanny"
        labelPersonName.fontColor = SKColor.init(red: 96/255, green: 205/255, blue: 233/255, alpha: 1.0)
        labelPersonName.fontName = ".SFUIText"
        labelPersonName.position = CGPoint(x:self.frame.midX, y:self.frame.midY+100)
        labelPersonName.zPosition = 10
        self.addChild(labelPersonName)
        
        
        
    }
    
    func setPresentationLabels(){
        
        //congrats!
        sentenceLabel.fontColor = SKColor.black
        sentenceLabel.fontName = ".SFUIText"
        sentenceLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY+70)
        sentenceLabel.fontSize = 25
        self.addChild(sentenceLabel)
        
        sentenceLabel1.fontColor = SKColor.black
        sentenceLabel1.position = CGPoint(x: self.frame.midX, y: self.frame.midY+40)
        sentenceLabel1.fontSize = 25
        self.addChild(sentenceLabel1)
        
        
    }
    
    func createButton(){
        self.button.position = CGPoint(x:self.frame.midX, y:self.frame.midY-130);
        self.addChild(self.button)
    }
    
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        // Check if the location of the touch is within the button's bounds
        if button.contains(touchLocation) {
            
            button.texture = SKTexture(imageNamed: "btn_playAgain_pressed")
            
            let sceneMoveTo = MainScene(size: self.size)
            sceneMoveTo.scaleMode = self.scaleMode
         
            let transition = SKTransition.moveIn(with: .right, duration: 0.8)
            self.scene?.view?.presentScene(sceneMoveTo ,transition: transition)
            
        }
        
    }
    
}

